import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((transaction) {
        return Card(
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                decoration: BoxDecoration(
                    border: Border.all(width: 3.0, color: Colors.black)),
                child: Text(
                  '\$${transaction.amount}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.title,
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    transaction.date.toString(),
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
