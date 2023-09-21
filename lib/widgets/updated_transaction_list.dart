import 'package:expenses_tracker/widgets/new_transaction.dart';
import 'package:expenses_tracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class UpdatedTransactionList extends StatefulWidget {
  const UpdatedTransactionList({super.key});

  @override
  State<UpdatedTransactionList> createState() => _UpdatedTransactionListState();
}

class _UpdatedTransactionListState extends State<UpdatedTransactionList> {
  final List<Transaction> _transactions = [];

  void _addTransaction(String title, double amount) {
    final newTransaction = Transaction(
      title: title,
      amount: amount,
      date: DateFormat('ddMMM hh:mm').format(
        DateTime.now(),
      ),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransactionInput(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
