import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_book_app/domain/constants/constants.dart';
import 'package:flutter_book_app/domain/model/book_model.dart';
import 'package:flutter_book_app/repository/book_repository.dart';
import 'package:flutter_book_app/repository/i_book_repository.dart';
import 'package:flutter_book_app/repository/local_repository.dart';
import 'package:get/state_manager.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

class BookController {
  final _bookRepository = GetIt.instance<IBookRepository>();
  final _localRepository = GetIt.instance<LocalRepository>();

  TextEditingController searchField = TextEditingController();
  int paginationIndex = 0;

  RxBool isSearching = false.obs;
  Rx<OrderBy> orderBy = OrderBy.relevance.obs;
  RxList<Book> books = <Book>[].obs;
  List favoritedIds = <String>[];

  get searchValidate => searchField.text.isNotEmpty;

  Future fetchBooks({bool paginate = false}) async {
    try {
      var result = <Book>[];
      isSearching.value = true;
      favoritedIds = _localRepository.favoritedIds;
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
        result = await _bookRepository.fetchBooks(searchField.text, orderBy.value);
      } else {
        result = await _localRepository.getBooks();
      }
      verifyFavorite(result);
      books.value = result;
    } finally {
      isSearching.value = false;
    }
  }

  Future saveFavorite(Book book) async {
    if (favoritedIds.contains(book.id)) {
      await removeFavorite(book.id!);
      await fetchBooks();
    } else {
      await _localRepository.favoriteBook(book);
    }
  }

  Future removeFavorite(String id) async {
    await _localRepository.removeBook(id);
  }

  verifyFavorite(List<Book> result) {
    for (var b in result) {
      if (favoritedIds.contains(b.id!)) {
        b.isFavorited.value = true;
      }
    }
  }
}
