import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  const TransactionList(this.transactions, this.deleteTransaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: transactions.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    "There aren't any transactions added yet!",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    height: 250.0,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 3.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          "\$ ${transactions[index].amount.toStringAsFixed(2)}",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        DateFormat('EddMMM hh:mm aa')
                            .format(transactions[index].date),
                        style:
                            const TextStyle(fontSize: 20.0, color: Colors.grey),
                      ),
                      trailing: IconButton(
                        onPressed: () =>
                            deleteTransaction(transactions[index].id),
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).colorScheme.error,
                        ),
                        iconSize: 30.0,
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
