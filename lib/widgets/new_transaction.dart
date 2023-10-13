import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactionInput extends StatefulWidget {
  final Function addTransaction;

  const NewTransactionInput(this.addTransaction, {super.key});

  @override
  State<NewTransactionInput> createState() => _NewTransactionInputState();
}

class _NewTransactionInputState extends State<NewTransactionInput> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  DateTime? _pickedDate;

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTransaction(enteredTitle, enteredAmount, _pickedDate);
    titleController.clear();
    amountController.clear();

    Navigator.of(context).pop();
  }

  void _pickDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((date) {
      setState(() {
        _pickedDate = date;
      });
    });
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
            Row(children: [
              Expanded(
                child: Text(
                  _pickedDate == null
                      ? "Date not chosen!"
                      : DateFormat('EddMMM hh:mm aa').format(_pickedDate!),
                ),
              ),
              TextButton(
                onPressed: _pickDate,
                child: Text(
                  "Choose date",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ]),
            ElevatedButton(
              onPressed: submitData,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  "Add Transaction",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
