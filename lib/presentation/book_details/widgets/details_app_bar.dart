import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class DetailsAppBar extends StatelessWidget {
  DetailsAppBar({super.key});
  RxBool marked = false.obs;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Card(
              shape: CircleBorder(),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 28,
                ),
              ),
            ),
          ),
          Obx(
            () => InkWell(
              onTap: () => marked.value = !marked.value,
              child: Card(
                shape: const CircleBorder(),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: marked.value
                      ? const Icon(
                          Icons.bookmark,
                          color: Colors.amber,
                          size: 28,
                        )
                      : const Icon(Icons.bookmark_border, size: 28),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
