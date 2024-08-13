import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BalanceView extends StatelessWidget {
  double balance;
  BalanceView({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Bank Balance",
            style: TextStyle(
              fontSize: 32,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '\$ ${NumberFormat.simpleCurrency(name: ' ').format(balance)}',
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
