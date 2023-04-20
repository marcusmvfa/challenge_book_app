import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_book_app/domain/constants/constants.dart';
import 'package:flutter_book_app/domain/model/book_model.dart';
import 'package:flutter_book_app/repository/book_repository.dart';
import 'package:flutter_book_app/repository/local_repository.dart';
import 'package:get/state_manager.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

class BookController {
  final BookRepository _bookRepository = BookRepository();
  final LocalRepository _localRepository = GetIt.instance<LocalRepository>();

  TextEditingController searchField = TextEditingController();
  int paginationIndex = 0;

  RxBool isSearching = false.obs;
  Rx<OrderBy> orderBy = OrderBy.relevance.obs;
  RxList<Book> books = <Book>[].obs;
  List favoritedIds = <String>[];

  get searchValidate => searchField.text.isNotEmpty;

  Future fetchBooks({bool paginate = false}) async {
    try {
      isSearching.value = true;
      final result = await _bookRepository.fetchBooks(searchField.text, orderBy.value);
      // final result = await _bookRepository.getBooks();
      books.value = result;
    } finally {
      isSearching.value = false;
    }
  }

  Future saveFavorite(Book book) async {
    await _localRepository.favoriteBook(book);
  }

  Future getBooksDatabase() async {
    final result = await _localRepository.getBooks();
    return result;
  }

  Future removeFavorite(String id) async {
    await _localRepository.removeBook(id);
  }

  verifyFavorite() {}
}
