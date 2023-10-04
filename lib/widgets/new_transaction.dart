import 'package:flutter/material.dart';

class NewTransactionInput extends StatefulWidget {
  final Function addTransaction;

  const NewTransactionInput(this.addTransaction, {super.key});

  @override
  State<NewTransactionInput> createState() => _NewTransactionInputState();
}

class _NewTransactionInputState extends State<NewTransactionInput> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTransaction(enteredTitle, enteredAmount);
    titleController.clear();
    amountController.clear();
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
