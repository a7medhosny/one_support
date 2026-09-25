import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:one_support/core/di/get_it.dart';
import 'package:one_support/one_support_app.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await init();

  runApp(const OneSupportApp());
}
