import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_book_app/domain/model/book_model.dart';
import 'package:flutter_book_app/domain/model/sales_info.dart';
import 'package:url_launcher/url_launcher.dart';

class PurchaseButton extends StatelessWidget {
  const PurchaseButton({super.key, required this.book});

  final Book? book;
  redirectLink() async {
    if (book?.saleInfo?.buyLink != null) {
      await launchUrl(Uri.parse(book!.saleInfo!.buyLink!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: Colors.green.shade800,
        ),
        onPressed: book?.saleInfo?.buyLink != null ? () => redirectLink() : null,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            "Adquirir",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
