import 'package:flutter/material.dart';
import 'package:flutter_book_app/controller/book_controller.dart';
import 'package:flutter_book_app/domain/constants/constants.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get_it/get_it.dart';

class OrderByButton extends StatelessWidget {
  OrderByButton({super.key});
  final BookController _controller = GetIt.instance<BookController>();

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Text("Order by"),
      const SizedBox(
        width: 8,
      ),
      Obx(
        () => DropdownButton<OrderBy>(
          value: _controller.orderBy.value,
          items: OrderBy.values.map<DropdownMenuItem<OrderBy>>((OrderBy value) {
            return DropdownMenuItem<OrderBy>(
              value: value,
              child: Text(
                value.toString(),
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            );
          }).toList(),
          onChanged: (OrderBy? newValue) {
            _controller.orderBy.value = newValue!;
            if (_controller.searchValidate) {
              _controller.fetchBooks();
            }
          },
        ),
      ),
    ]);
  }
}
