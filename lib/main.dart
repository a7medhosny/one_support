import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:one_support/core/di/get_it.dart';
import 'package:one_support/core/services/firebase_messaging_service.dart';
import 'package:one_support/one_support_app.dart';

import 'firebase_options.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint(
    'Handling a background message: ${message.notification?.title} - ${message.notification?.body}',
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await init();

  await getIt<FirebaseMessagingService>().initialize();
  

  runApp(const OneSupportApp());
}
