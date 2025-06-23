import 'package:get_it/get_it.dart';
import 'package:modelo_mvvm/modules/auth/login/repositories/auth_repository.dart';
import 'package:modelo_mvvm/modules/auth/login/services/auth_service.dart';
import 'package:modelo_mvvm/modules/auth/login/viewModels/login_view_model.dart';

final getIt = GetIt.instance;

void authDependecies() {
  getIt.registerLazySingleton<AuthService>(() => AuthService());

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(getIt<AuthService>()),
  );
  getIt.registerLazySingleton<LoginViewModel>(
    () => LoginViewModel(getIt<AuthRepository>()),
  );
}
