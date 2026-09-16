import 'package:flutter_test/flutter_test.dart';
import 'package:one_support/core/networking/api_error_handler.dart';
import 'package:one_support/core/networking/api_result.dart';
import 'package:one_support/core/storage/preferences/preferences_constants.dart';
import 'package:one_support/core/storage/preferences/preferences_service.dart';
import 'package:one_support/core/storage/secure_storage/secure_storage_constants.dart';
import 'package:one_support/core/storage/secure_storage/secure_storage_service.dart';
import 'package:one_support/features/auth/login/data/datasource/login_remote_data_source.dart';
import 'package:one_support/features/auth/login/data/models/login_request_model.dart';
import 'package:one_support/features/auth/login/data/models/login_response_model.dart';
import 'package:one_support/features/auth/login/data/repository/login_repository.dart';
import 'package:one_support/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:one_support/features/auth/login/presentation/cubit/login_state.dart';

class FakeLoginRemoteDataSource implements LoginRemoteDataSource {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class FakeLoginRepository extends LoginRepository {
  FakeLoginRepository() : super(FakeLoginRemoteDataSource());

  ApiResult<LoginResponseModel>? mockResult;

  @override
  Future<ApiResult<LoginResponseModel>> login(
    LoginRequestModel loginRequestModel,
  ) async {
    return mockResult!;
  }
}

class FakeSecureStorageService implements SecureStorageService {
  final Map<String, String> data = {};

  @override
  Future<void> save({required String key, required String value}) async {
    data[key] = value;
  }

  @override
  Future<String?> get({required String key}) async => data[key];

  @override
  Future<void> remove({required String key}) async {
    data.remove(key);
  }

  @override
  Future<void> clear() async {
    data.clear();
  }

  @override
  Future<bool> containsKey({required String key}) async =>
      data.containsKey(key);
}

class FakePreferencesService implements PreferencesService {
  final Map<String, dynamic> data = {};

  @override
  Future<bool> saveBool(String key, bool value) async {
    data[key] = value;
    return true;
  }

  @override
  bool? getBool(String key) => data[key] as bool?;

  @override
  Future<bool> saveString(String key, String value) async {
    data[key] = value;
    return true;
  }

  @override
  String? getString(String key) => data[key] as String?;

  @override
  Future<bool> remove(String key) async {
    data.remove(key);
    return true;
  }

  @override
  Future<bool> clear() async {
    data.clear();
    return true;
  }

  @override
  bool containsKey(String key) => data.containsKey(key);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  late FakeLoginRepository loginRepository;
  late FakeSecureStorageService secureStorageService;
  late FakePreferencesService preferencesService;
  late LoginCubit loginCubit;

  setUp(() {
    loginRepository = FakeLoginRepository();
    secureStorageService = FakeSecureStorageService();
    preferencesService = FakePreferencesService();
    loginCubit = LoginCubit(
      loginRepository,
      secureStorageService,
      preferencesService,
    );
  });

  tearDown(() {
    loginCubit.close();
  });

  test('initial state is LoginState.initial()', () {
    expect(loginCubit.state, const LoginState.initial());
  });

  test(
    'emits [loading, success] and persists tokens and preferences when login succeeds',
    () async {
      const response = LoginResponseModel(
        success: true,
        token: 'fake_token',
        refreshToken: 'fake_refresh_token',
        userName: 'Test User',
        email: 'test@example.com',
      );
      loginRepository.mockResult = const ApiResult.success(response);

      final expectedStates = [
        const LoginState.loading(),
        const LoginState.success(response),
      ];

      expectLater(loginCubit.stream, emitsInOrder(expectedStates));

      await loginCubit.login(
        const LoginRequestModel(
          email: 'test@example.com',
          password: 'password123',
          rememberMe: true,
        ),
      );

      // Verify storage persistence
      expect(
        await secureStorageService.get(key: SecureStorageConstants.accessToken),
        'fake_token',
      );
      expect(
        await secureStorageService.get(
          key: SecureStorageConstants.refreshToken,
        ),
        'fake_refresh_token',
      );
      expect(preferencesService.getBool(PreferencesConstants.rememberMe), true);
      expect(
        preferencesService.getString(PreferencesConstants.userEmail),
        'test@example.com',
      );
    },
  );

  test('emits [loading, failure] when login fails', () async {
    final errorHandler = ErrorHandler.handle('Unknown error');
    loginRepository.mockResult = ApiResult.failure(errorHandler);

    final expectedStates = [
      const LoginState.loading(),
      LoginState.failure(errorHandler.apiErrorModel),
    ];

    expectLater(loginCubit.stream, emitsInOrder(expectedStates));

    await loginCubit.login(
      const LoginRequestModel(
        email: 'test@example.com',
        password: 'password123',
      ),
    );
  });
}
