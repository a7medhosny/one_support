import 'package:flutter/material.dart';
import 'package:one_support/core/di/get_it.dart';
import 'package:one_support/one_support_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(const OneSupportApp());
}
