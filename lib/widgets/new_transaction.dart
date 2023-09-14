import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final amountInputController = TextEditingController();
  final titleInputController = TextEditingController();
  final Function addTransaction;

  NewTransaction(this.addTransaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleInputController,
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
            ),
            TextField(
              controller: amountInputController,
              decoration: const InputDecoration(
                label: Text('Amount'),
              ),
              keyboardType: TextInputType.number,
            ),
            TextButton(
              onPressed: () {
                addTransaction(
                  titleInputController.text,
                  double.parse(amountInputController.text),
                );
              },
              child: const Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
