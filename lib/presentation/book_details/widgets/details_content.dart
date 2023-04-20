import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_book_app/domain/model/book_model.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class DetailsContent extends StatefulWidget {
  DetailsContent({super.key, required Book book});

  @override
  State<DetailsContent> createState() => _DetailsContentState();
}

class _DetailsContentState extends State<DetailsContent> {
  RxBool showMore = false.obs;

  String shortContent = "";

  getShortContent() {
    if (content.length > 250) {
      shortContent = "${content.substring(0, 250)}...";
    }
  }

  @override
  void initState() {
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
            Text(
              "R\$ 25,00",
              style: TextStyle(fontSize: 18, color: Colors.green.shade700, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(height: 16),
        Obx(
          () => Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(
              !showMore.value ? content : shortContent,
              style: TextStyle(height: 1.5, fontSize: 14, color: Colors.grey.shade700),
            ),
            content.length > 250
                ? InkWell(
                    onTap: () => showMore.value = !showMore.value,
                    child: Text(
                      showMore.value ? "show less" : "show more",
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

String content =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).";
