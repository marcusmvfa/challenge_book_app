import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_book_app/controller/book_controller.dart';
import 'package:flutter_book_app/domain/model/book_model.dart';
import 'package:flutter_book_app/presentation/book_details/book_details_view.dart';
import 'package:flutter_book_app/presentation/home/widgets/book_list/widgets/book_list_item/content.dart';
import 'package:get/state_manager.dart';
import 'package:get_it/get_it.dart';

class BookListItem extends StatelessWidget {
  BookListItem({super.key, required this.book});
  final BookController _controller = GetIt.instance<BookController>();

  final Book book;
  RxBool marked = false.obs;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => BookDetailsView(book: book))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: book.volumeInfo?.imageLinks?.smallThumbnail != null
                  ? Image.network(book.volumeInfo!.imageLinks!.smallThumbnail!)
                  : const FlutterLogo(size: 124),
            ),
            const SizedBox(width: 8),
            Expanded(flex: 4, child: Content(book: book)),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: Obx(
                () => InkWell(
                  onTap: () {
                    book.isFavorited.value = !book.isFavorited.value;
                    _controller.saveFavorite(book);
                    // _controller.removeFavorite(book.id!);
                  },
                  child: book.isFavorited.value ? const Icon(Icons.bookmark, color: Colors.amber) : const Icon(Icons.bookmark_border),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
