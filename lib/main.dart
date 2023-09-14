import 'package:expenses_tracker/widgets/updated_transaction_list.dart';

import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      title: "Expense Tracker App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // const HomePage({super.key});

  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hi there!! Welcome Back'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: Colors.grey,
              elevation: 5.0,
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'CHART',
                ),
              ),
            ),
            UpdatedTransactionList(),
          ],
        ),
      ),
    );
  }
}
