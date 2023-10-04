import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

// Entry point
void main() => runApp(App());

// Main App
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      title: "Expense Tracker App",
      home: HomePage(),
    );
  }
}

// HomePage widget
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [];

  void _addTransaction(String title, double amount) {
    final newTransaction = Transaction(
      title: title,
      amount: amount,
      date: DateFormat('ddMMM hh:mm').format(
        DateTime.now(),
      ),
    );

    setState(
      () {
        _transactions.add(newTransaction);
      },
    );
  }

  void _addNewTransactionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return NewTransactionInput(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hi there!! Welcome Back'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Card(
              color: Colors.grey,
              elevation: 5.0,
              child: SizedBox(
                width: double.infinity,
                height: 50.0,
                child: Text(
                  'CHART',
                ),
              ),
            ),
            TransactionList(_transactions),
            //Add other widgets here
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewTransactionSheet(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
