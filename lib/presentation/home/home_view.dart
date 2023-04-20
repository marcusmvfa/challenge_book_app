import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_book_app/controller/book_controller.dart';
import 'package:flutter_book_app/presentation/home/widgets/book_list/book_list.dart';
import 'package:flutter_book_app/presentation/home/widgets/book_list/widgets/book_list_item/book_list_item.dart';
import 'package:flutter_book_app/presentation/home/widgets/order_by_dropdown.dart';
import 'package:flutter_book_app/presentation/home/widgets/search_bar.dart';
import 'package:get/state_manager.dart';
import 'package:get_it/get_it.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                SearchBar(),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Results",
                      style: TextStyle(fontSize: 18),
                    ),
                    OrderByButton()
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                BookList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
