import 'package:flutter_book_app/domain/constants/constants.dart';
import 'package:flutter_book_app/domain/model/book_model.dart';
import 'package:flutter_book_app/repository/i_book_repository.dart';
import 'package:flutter_book_app/services/book_service.dart';

class BookRepository implements IBookRepository {
  final BookService _bookService = BookService();

  @override
  Future<List<Book>> fetchBooks(String? pattern, OrderBy orderBy) async {
    final result = await _bookService.fetchBooks(pattern!, orderBy);
    final books = List<Book>.from(result.items);
    return books;
  }

  @override
  Future<void> removeFavorite(String id) {
    // TODO: implement removeFavorite
    throw UnimplementedError();
  }

  @override
  Future<void> saveFavorite(Book book) {
    // TODO: implement saveFavorite
    throw UnimplementedError();
  }
}
