import 'package:flutter_book_app/domain/constants/constants.dart';
import 'package:flutter_book_app/domain/model/book_model.dart';

abstract class IBookRepository {
  Future<List<Book>> fetchBooks(String? pattern, OrderBy orderBy);
  Future<void> saveFavorite(Book book);
  Future<void> removeFavorite(String id);
}
