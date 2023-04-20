import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_book_app/domain/model/book_model.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class DetailsContent extends StatefulWidget {
  DetailsContent({super.key, required this.book});
  final Book book;
  @override
  State<DetailsContent> createState() => _DetailsContentState();
}

class _DetailsContentState extends State<DetailsContent> {
  late Book book;

  RxBool showMore = false.obs;
  String content = "";
  String shortContent = "";

  getShortContent() {
    if ((book.volumeInfo?.description ?? "").length > 250) {
      shortContent = "${book.volumeInfo!.description!.substring(0, 250)}...";
    }
  }

  @override
  void initState() {
    book = widget.book;
    content = book.volumeInfo!.description ?? "";
    getShortContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            book.saleInfo?.listPrice?.amount != null
                ? Text(
                    "R\$ ${book.saleInfo?.listPrice?.amount}",
                    style: TextStyle(fontSize: 18, color: Colors.green.shade700, fontWeight: FontWeight.bold),
                  )
                : const SizedBox()
          ],
        ),
        const SizedBox(height: 16),
        Obx(
          () => Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(
              !showMore.value ? book.volumeInfo?.description ?? "" : shortContent,
              style: TextStyle(height: 1.5, fontSize: 14, color: Colors.grey.shade700),
            ),
            content.length > 250
                ? InkWell(
                    onTap: () => showMore.value = !showMore.value,
                    child: Text(
                      !showMore.value ? "show less" : "show more",
                      style: TextStyle(fontSize: 18, color: Colors.green.shade700, fontWeight: FontWeight.bold),
                    ),
                  )
                : const SizedBox()
          ]),
        ),
      ],
    );
  }
}
