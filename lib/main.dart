import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

// Entry point
void main() => runApp(const App());

// Main App
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blueGrey, errorColor: Colors.red),
        fontFamily: "Open Sans",
        textTheme: const TextTheme(
          labelMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Quicksand",
              fontSize: 19.0),
          titleMedium: TextStyle(
            fontFamily: "Quicksand",
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            fontFamily: "Quicksand",
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
          ),
        ),
        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: "Quicksand",
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: "Expense Tracker App",
      home: const HomePage(),
    );
  }
}

// HomePage widget
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [];

  void _addTransaction(String title, double amount, DateTime date) {
    final newTransaction = Transaction(
      title: title,
      amount: amount,
      date: date,
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

  void _deleteTransaction(String transactionId) {
    setState(() {
      _transactions
          .removeWhere((transaction) => transaction.id == transactionId);
    });
  }

  List<Transaction> get _getRecentTransactions {
    return _transactions.where((transaction) {
      return transaction.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hi Edwin!'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Chart(_getRecentTransactions),

            TransactionList(_transactions, _deleteTransaction),
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
