import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_book_app/domain/model/book_model.dart';
import 'package:flutter_book_app/presentation/shared/rating_stars.dart';

class Content extends StatelessWidget {
  const Content({super.key, required this.book});
  final Book book;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          book.volumeInfo?.title ?? "",
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 4),
        Text(
          "By Brene Brown",
          style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
        ),
        const SizedBox(height: 4),
        RatingStars(stars: book.volumeInfo?.averageRating?.toDouble() ?? 0)
      ],
    );
  }
}
