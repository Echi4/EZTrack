import 'package:expenses_tracker/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  const Chart(this.recentTransaction, {super.key});

  List<Map<String, dynamic>> get getRecentTransactions {
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
      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalAmountPerDay
      };
    });
  }

  double get totalWeeklySpending {
    return getRecentTransactions.fold(0.0, (previousValue, element) {
      return previousValue + element["amount"];
    });
  }

  @override
  Widget build(BuildContext context) {
    // getRecentTransactions;
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: getRecentTransactions.map((transactionData) {
          return ChartBar(
              transactionData["amount"],
              transactionData["day"],
              totalWeeklySpending == 0.0
                  ? 0.0
                  : transactionData["amount"] / totalWeeklySpending);
        }).toList(),
      ),
    );
  }
}
