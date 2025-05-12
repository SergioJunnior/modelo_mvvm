import 'package:flutter/material.dart';
import 'package:modelo_mvvm/app_widget.dart';
import 'package:modelo_mvvm/core/dependecies/configure_dependencies.dart';

void main() async {
  await configureDependencies();
  runApp(const MyApp());
}
