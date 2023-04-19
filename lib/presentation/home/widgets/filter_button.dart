import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
      onPressed: () {},
      child: Row(
        children: [
          Icon(
            Icons.filter_list_sharp,
            color: Colors.grey.shade600,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            "Filtrar",
            style: TextStyle(color: Colors.grey.shade600),
          )
        ],
      ),
    );
  }
}
