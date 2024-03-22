import 'package:gannar_books/data/datasources/local/local_storage.dart';
import 'package:gannar_books/data/datasources/network/rest_api_client.dart';
import 'package:gannar_books/data/repositories/books_repository_impl.dart';
import 'package:gannar_books/data/repositories/users_repository_impl.dart';
import 'package:gannar_books/domain/repositories/books_repository.dart';
import 'package:gannar_books/domain/repositories/users_repository.dart';
import 'package:gannar_books/presentation/home/home_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupServices() async {
  getIt.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
  await getIt.allReady();

  getIt.registerSingleton<LocalStorage>(
      LocalStorageImpl(sharedPreferences: getIt()));

  getIt.registerSingleton<RestApiClient>(RestApiClientImpl());

  getIt.registerSingleton<UsersRepository>(UsersRepositoryImpl(getIt()));

  getIt.registerSingleton<BooksRepository>(
      BooksRepositoryImpl(getIt(), getIt()));

  getIt.registerFactory<HomeProvider>(
      () => HomeProvider(booksRepository: getIt(), usersRepository: getIt()));
}
