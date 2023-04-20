import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_book_app/controller/book_controller.dart';
import 'package:flutter_book_app/presentation/shared/book_list_item/book_list_item.dart';
import 'package:flutter_book_app/presentation/home/widgets/order_by_dropdown.dart';
import 'package:flutter_book_app/presentation/home/widgets/search_bar.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get_it/get_it.dart';

class BookList extends StatelessWidget {
  BookList({super.key});
  final BookController _controller = GetIt.instance<BookController>();
  @override
  Widget build(BuildContext context) {
    return Column(
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
        Obx(
          () => !_controller.isSearching.value
              ? _controller.books.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: Text(
                        "The results of your search will appear here!",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade700),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const RangeMaintainingScrollPhysics(),
                      itemCount: _controller.books.length,
                      itemExtent: 120,
                      itemBuilder: (context, index) => BookListItem(book: _controller.books[index]),
                    )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ],
    );
  }
}
