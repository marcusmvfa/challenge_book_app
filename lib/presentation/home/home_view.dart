import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_book_app/presentation/home/widgets/book_list_item/book_list_item.dart';
import 'package:flutter_book_app/presentation/home/widgets/filter_button.dart';
import 'package:flutter_book_app/presentation/home/widgets/search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
        child: Column(
          children: [
            const SearchBar(),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Resultados",
                  style: TextStyle(fontSize: 18),
                ),
                FilterButton()
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const RangeMaintainingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) => BookListItem(),
            )
          ],
        ),
      ),
    ));
  }
}
