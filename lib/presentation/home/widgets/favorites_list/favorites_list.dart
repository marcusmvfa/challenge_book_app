import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_book_app/presentation/shared/book_list_item/book_list_item.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../../../../controller/book_controller.dart';

class FavoritesList extends StatefulWidget {
  FavoritesList({super.key});

  @override
  State<FavoritesList> createState() => _FavoritesListState();
}

class _FavoritesListState extends State<FavoritesList> {
  final BookController _controller = GetIt.instance<BookController>();
  @override
  void initState() {
    _controller.fetchFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          "Favorites",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child:

                // Padding(
                //               padding: const EdgeInsets.only(top: 32),
                //               child: Text(
                //                 "The results of your search will appear here!",
                //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade700),
                //               ),
                //             )
                //           :
                Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: const RangeMaintainingScrollPhysics(),
                itemCount: _controller.favoritesBooks.length,
                itemExtent: 120,
                itemBuilder: (context, index) => BookListItem(book: _controller.favoritesBooks[index]),
              ),
            )),
      ),
    );
  }
}
