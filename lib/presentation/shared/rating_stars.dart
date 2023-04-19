import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({required this.stars, super.key});
  final double stars;
  final int maxStars = 5;

  get filledStar => Icon(Icons.star, color: Colors.amber.shade300, size: 18);
  get halfStar => Icon(Icons.star_half, color: Colors.amber.shade300, size: 18);
  get emptyStar => const Icon(Icons.star_border, color: Colors.grey, size: 18);

  fillStars(int index) {
    Icon icon;
    if (index >= stars) {
      icon = emptyStar;
    } else if (index > stars - 1 && index < stars) {
      icon = halfStar;
    } else {
      icon = filledStar;
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(maxStars, (index) => fillStars(index)),
    );
  }
}
