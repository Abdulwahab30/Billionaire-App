import 'package:flutter/material.dart';

class AddMoneyButton extends StatelessWidget {
  void Function() addMoneyFunction;
  AddMoneyButton({super.key, required this.addMoneyFunction});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[900],
              minimumSize: const Size(double.infinity, 0)),
          onPressed: addMoneyFunction,
          child: const Text(
            "Add Balance",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
