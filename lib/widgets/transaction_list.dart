import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactions.map(
      (transaction) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 5.0),
                  ),
                  child: Text(
                    "\$ ${transaction.amount}",
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.title,
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      transaction.date,
                      style: const TextStyle(fontSize: 15.0),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    ).toList());
  }
}
