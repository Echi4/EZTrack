import 'package:flutter/material.dart';

class NewTransactionInput extends StatelessWidget {
  final Function addTransaction;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  NewTransactionInput(this.addTransaction, {super.key});

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addTransaction(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Title"),
              keyboardType: TextInputType.text,
              controller: titleController,
              onEditingComplete: () {
                if (titleController.text.isNotEmpty) {
                  FocusScope.of(context).nextFocus();
                }
              },
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Amount"),
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              onPressed: submitData,
              child: const Text("Add Transaction"),
            )
          ],
        ),
      ),
    );
  }
}
