import 'package:gannar_books/data/datasources/local/local_storage.dart';
import 'package:gannar_books/data/repositories/users_repository_impl.dart';
import 'package:gannar_books/domain/repositories/users_repository.dart';
import 'package:gannar_books/presentation/login/login_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupServices() async {
  getIt.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
  await getIt.allReady();

  getIt.registerLazySingleton<LocalStorage>(
      () => LocalStorageImpl(sharedPreferences: getIt()));

  getIt.registerLazySingleton<UsersRepository>(
      () => UsersRepositoryImpl(getIt()));

  getIt.registerLazySingleton<LoginProvider>(() => LoginProvider(getIt()));
}
