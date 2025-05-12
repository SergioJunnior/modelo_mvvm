import 'package:get_it/get_it.dart';
import 'package:modelo_mvvm/core/dependecies/auth/auth_depencies.dart';
import 'package:modelo_mvvm/core/dependecies/dioDependecies/dio_depencies.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  authDependecies();
  dioDepencies();
}
