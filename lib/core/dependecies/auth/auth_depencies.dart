import 'package:get_it/get_it.dart';
import 'package:modelo_mvvm/modules/auth/login/services/auth_service.dart';
import 'package:modelo_mvvm/modules/auth/login/viewModels/login_view_model.dart';
import 'package:modelo_mvvm/modules/auth/register/service/register_service.dart';
import 'package:modelo_mvvm/modules/auth/register/viewModels/register_view_model.dart';

final getIt = GetIt.instance;

void authDependecies() {
  getIt.registerLazySingleton<AuthService>(() => AuthService());
  getIt.registerLazySingleton<LoginViewModel>(
    () => LoginViewModel(getIt<AuthService>()),
  );

  getIt.registerLazySingleton<RegisterService>(() => RegisterService());
  getIt.registerLazySingleton<RegisterViewModel>(
    () => RegisterViewModel(getIt<RegisterService>()),
  );
}
