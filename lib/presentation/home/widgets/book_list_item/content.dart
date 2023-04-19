import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_book_app/presentation/shared/rating_stars.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Braving The Wilderness",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 4),
        Text("By Brene Brown",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade700,
            )),
        const SizedBox(height: 4),
        const RatingStars(stars: 3.5)
      ],
    );
  }
}
