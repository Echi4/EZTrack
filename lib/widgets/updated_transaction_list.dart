import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UpdatedTransactionList extends StatefulWidget {
  const UpdatedTransactionList({super.key});

  @override
  State<UpdatedTransactionList> createState() => _UpdatedTransactionListState();
}

class _UpdatedTransactionListState extends State<UpdatedTransactionList> {
  final List<Transaction> _transactions = [];

  void _addNewTransaction(String transactionTitle, double transactionAmount) {
    final newTransaction = Transaction(
      title: transactionTitle,
      amount: transactionAmount,
      date: DateFormat('EEE hh:mma').format(DateTime.now()),
    );
    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
