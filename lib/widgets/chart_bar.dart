import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String dayLabel;
  final double spendingAmount;
  final double spendingPercentageOfTheWholeWeek;

  const ChartBar(
      this.dayLabel, this.spendingAmount, this.spendingPercentageOfTheWholeWeek,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Text("\$${spendingAmount.toStringAsFixed(0)}"),
        ),
        const SizedBox(
          height: 5.0,
        ),
        SizedBox(
          height: 80.0,
          width: 10.0,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPercentageOfTheWholeWeek,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(dayLabel),
      ],
    );
  }
}
