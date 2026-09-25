import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import 'firebase_messaging_service.dart';

class FirebaseMessagingServiceImpl implements FirebaseMessagingService {
  final FirebaseMessaging _messaging;

  FirebaseMessagingServiceImpl(this._messaging);

  @override
  Future<void> initialize() async {
    await _requestPermission();

    await FirebaseMessaging.instance.setAutoInitEnabled(true);

    FirebaseMessaging.onMessage.listen(_onForegroundMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(_onNotificationOpened);

    FirebaseMessaging.instance.getInitialMessage().then(_handleInitialMessage);

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    await getToken();
  }

  Future<void> _requestPermission() async {
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );
  }

  void _onForegroundMessage(RemoteMessage message) {
    // TODO
  }

  void _onNotificationOpened(RemoteMessage message) {
    // TODO
  }

  void _handleInitialMessage(RemoteMessage? message) {
    if (message == null) return;
  }

  @override
  Future<String?> getToken() async {
    String? token = await _messaging.getToken();
    debugPrint('Firebase Messaging Token: $token');
    return token;
  }

  @override
  Stream<String> get onTokenRefresh => _messaging.onTokenRefresh;
}
