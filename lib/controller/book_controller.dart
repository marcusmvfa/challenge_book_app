import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_book_app/domain/constants/constants.dart';
import 'package:flutter_book_app/domain/model/book_model.dart';

import 'package:flutter_book_app/repository/i_book_repository.dart';
import 'package:flutter_book_app/repository/local_repository.dart';
import 'package:get/state_manager.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

class BookController {
  final _bookRepository = GetIt.instance<IBookRepository>();
  final _localRepository = GetIt.instance<LocalRepository>();

  TextEditingController searchField = TextEditingController(text: "Flutter");
  int paginationIndex = 0;
  int bottomNAvigationIndex = 0;

  RxBool isSearching = false.obs;
  Rx<OrderBy> orderBy = OrderBy.relevance.obs;
  RxList<Book> books = <Book>[].obs;
  RxList<Book> favoritesBooks = <Book>[].obs;
  List favoritedIds = <String>[];

  get searchValidate => searchField.text.isNotEmpty;

  Future fetchBooks() async {
    try {
      var result = <Book>[];
      isSearching.value = true;
      if (_localRepository.favoritedIds.isEmpty) {
        await fetchFavoritesIds();
      }
      favoritedIds = _localRepository.favoritedIds;

      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
        result = await _bookRepository.fetchBooks(searchField.text, orderBy.value);
        verifyFavorite(result);
        books.value = result;
      } else {
        result = await _localRepository.getBooks();
        books.value = result;
      }
    } finally {
      isSearching.value = false;
    }
  }

  Future fetchFavorites() async {
    try {
      var result = <Book>[];

      result = await _localRepository.getBooks();
      favoritesBooks.value = result;
    } finally {}
  }

  Future saveFavorite(Book book) async {
    if (favoritedIds.contains(book.id)) {
      await removeFavorite(book.id!);
      await fetchBooks();
    } else {
      favoritedIds.add(book.id);
      await _localRepository.favoriteBook(book);
    }
  }

  Future removeFavorite(String id) async {
    await _localRepository.removeBook(id);
    final auxList = List.from(favoritesBooks);
    auxList.removeWhere((element) => element.id == id);
    favoritesBooks.value = List.from(auxList);
  }

  verifyFavorite(List<Book> result) {
    for (var b in result) {
      if (favoritedIds.contains(b.id!)) {
        b.isFavorited.value = true;
      }
    }
  }

  Future fetchFavoritesIds() async {
    await _localRepository.getFavoriteIds();
  }
}
