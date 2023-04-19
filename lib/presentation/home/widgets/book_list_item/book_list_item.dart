import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_book_app/presentation/home/widgets/book_list_item/content.dart';
import 'package:get/state_manager.dart';

class BookListItem extends StatelessWidget {
  BookListItem({super.key});
  RxBool marked = false.obs;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex: 2, child: FlutterLogo()),
        const SizedBox(width: 8),
        const Expanded(flex: 4, child: Content()),
        const SizedBox(width: 8),
        Expanded(
          flex: 1,
          child: Obx(
            () => InkWell(
              onTap: () => marked.value = !marked.value,
              child: marked.value ? const Icon(Icons.bookmark, color: Colors.amber) : const Icon(Icons.bookmark_border),
            ),
          ),
        )
      ],
    );
  }
}
