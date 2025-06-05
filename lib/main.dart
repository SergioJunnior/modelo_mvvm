import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modelo_mvvm/app_widget.dart';
import 'package:modelo_mvvm/core/dependecies/configure_dependencies.dart';
import 'package:modelo_mvvm/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await configureDependencies();
  runApp(const MyApp());
}
