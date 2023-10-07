import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "There aren't any transactions added yet!",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  height: 200.0,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20.0),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 5.0),
                          ),
                          child: Text(
                            "\$ ${transactions[index].amount.toStringAsFixed(2)}",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transactions[index].title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              transactions[index].date,
                              style: const TextStyle(
                                  fontSize: 20.0, color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
