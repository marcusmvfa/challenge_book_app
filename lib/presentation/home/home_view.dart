import 'package:flutter/material.dart';
import 'package:flutter_book_app/controller/book_controller.dart';
import 'package:flutter_book_app/presentation/home/widgets/book_list/book_list.dart';
import 'package:flutter_book_app/presentation/home/widgets/favorites_button.dart';
import 'package:get_it/get_it.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final BookController _controller = GetIt.instance<BookController>();
  @override
  void initState() {
    // _controller.fetchBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Book App",
          style: TextStyle(color: Colors.black),
        ),
        actions: [FavoritesButton()],
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: BookList(),
          ),
        ),
      ),
    );
  }
}
