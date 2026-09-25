abstract class FirebaseMessagingService {
  Future<void> initialize();

  Future<String?> getToken();

  Stream<String> get onTokenRefresh;
}