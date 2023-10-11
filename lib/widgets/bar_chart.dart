import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  const Chart(this.recentTransaction, {super.key});

  List<Map<String, Object>> get getRecentTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalAmountPerDay = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalAmountPerDay += recentTransaction[i].amount;
        }
      }
      print(weekDay);
      print(totalAmountPerDay);
      return {
        "Day": DateFormat.E().format(weekDay),
        "Amount": totalAmountPerDay
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(getRecentTransactions);
    return const Card(
      child: Column(
        children: [
          Text("Test!"),
        ],
      ),
    );
  }
}
