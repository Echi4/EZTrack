import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      title: "Expense Tracker App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // const HomePage({super.key});

  final List<Transaction> transactions = [
    Transaction(
      title: 'Mkate',
      amount: 2000,
      date: DateFormat('EEE hh:mma').format(DateTime.now()),
    ),
    Transaction(
      title: 'Soda',
      amount: 1000,
      date: DateFormat('EEE hh:mma').format(DateTime.now()),
    ),
    Transaction(
      title: 'Zege',
      amount: 2500,
      date: DateFormat('EEE hh:mma').format(DateTime.now()),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hi there!! Welcome Back'),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            width: 200.0,
            child: const Card(
              color: Colors.grey,
              elevation: 5.0,
              child: Text(
                'edwin',
              ),
            ),
          ),
          Column(
              children: transactions.map((transaction) {
            return Card(
              child: Row(
                children: [
                  Container(
                    child: Text(
                      transaction.amount.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.0),
                    ),
                    padding: EdgeInsets.all(10.0),
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    decoration: BoxDecoration(
                        border: Border.all(width: 3.0, color: Colors.black)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.title,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        transaction.date.toString(),
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            );
          }).toList())
        ],
      ),
    );
  }
}
