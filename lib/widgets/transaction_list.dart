import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
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
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        iconSize: 30.0,
                      ),
                    ),
                    // child: Row(
                    //   children: [

                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [

                    //       ],
                    //     )
                    //   ],
                    // ),
                  );
                },
              ),
            ),
    );
  }
}
