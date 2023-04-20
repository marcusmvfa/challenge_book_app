import 'package:flutter_book_app/controller/book_controller.dart';
import 'package:flutter_book_app/repository/book_repository.dart';
import 'package:flutter_book_app/repository/i_book_repository.dart';
import 'package:flutter_book_app/repository/local_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
Future<void> configureInjection() async {
  getIt.registerLazySingleton<BookController>(() => BookController());

  getIt.registerFactory<IBookRepository>(() => BookRepository());
  getIt.registerFactory<LocalRepository>(() => LocalRepository());
}
