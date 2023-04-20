import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_book_app/domain/model/book_model.dart';
import 'package:flutter_book_app/presentation/book_details/widgets/details_app_bar.dart';
import 'package:flutter_book_app/presentation/book_details/widgets/details_content.dart';
import 'package:flutter_book_app/presentation/book_details/widgets/details_header.dart';
import 'package:flutter_book_app/presentation/book_details/widgets/purchase_button.dart';
import 'package:get/get.dart';

class BookDetailsView extends StatelessWidget {
  BookDetailsView({super.key, required this.book});
  final Book book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 64),
              child: SizedBox(
                width: double.maxFinite,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  DetailsHeader(volumeInfo: book.volumeInfo),
                  const SizedBox(height: 16),
                  DetailsContent(book: book),
                ]),
              ),
            ),
            DetailsAppBar(),
            Align(alignment: Alignment.bottomCenter, child: PurchaseButton(book: book)),
          ],
        ),
      ),
    );
  }
}
