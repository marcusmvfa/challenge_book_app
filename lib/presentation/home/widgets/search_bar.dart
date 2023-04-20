import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_book_app/controller/book_controller.dart';
import 'package:get_it/get_it.dart';

class SearchBar extends StatefulWidget {
  SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final BookController _controller = GetIt.instance<BookController>();

  Timer? searchOnStoppedTyping;

  _onChangeHandler(value) {
    const duration = Duration(milliseconds: 800);
    if (searchOnStoppedTyping != null) {
      setState(() => searchOnStoppedTyping!.cancel());
    }
    setState(() => searchOnStoppedTyping = Timer(duration, () => _controller.fetchBooks()));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8)),
        child: TextFormField(
          controller: _controller.searchField,
          onChanged: _onChangeHandler,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey.shade600,
            ),
            contentPadding: const EdgeInsets.all(8),
            border: InputBorder.none,
            hintText: "Search for a book...",
          ),
        ),
      ),
    );
  }
}
