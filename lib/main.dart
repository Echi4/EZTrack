import 'package:flutter/material.dart';

void main() => runApp(App());

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
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hi there!! Welcome Back'),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            width: 200.0,
            child: const Card(
              color: Colors.grey,
              elevation: 5.0,
              child: Text(
                'edwin',
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            width: 200.0,
            child: const Card(
              color: Colors.grey,
              elevation: 5.0,
              child: Text(
                'edwin',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
