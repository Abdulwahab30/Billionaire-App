import 'package:billionaireapp/add_money_button.dart';
import 'package:billionaireapp/balance_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void addMoney() async {
    setState(() {
      balance = balance + 500;
    });

// Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
// Save an double value to 'decimal' key.
    await prefs.setDouble('balance', balance);

    print('$balance');
  }

  @override
  void initState() {
    // TODO: implement initState
    loadBalance();
    super.initState();
  }

  void loadBalance() async {
// Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      balance = prefs.getDouble('balance') ?? 0;
    });
  }

  double balance = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Billionaire App"),
          // backgroundColor: const Color.fromARGB(255, 43, 43, 43),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          height: double.infinity,
          color: Colors.blueGrey[900],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BalanceView(balance: balance),
              AddMoneyButton(
                addMoneyFunction: addMoney,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
