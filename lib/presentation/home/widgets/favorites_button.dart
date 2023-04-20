import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_book_app/presentation/home/widgets/favorites_list/favorites_list.dart';

class FavoritesButton extends StatelessWidget {
  const FavoritesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavoritesList())),
        child: Row(
          children: const [
            Text(
              "Favorites",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
