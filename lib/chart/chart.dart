import 'package:flutter/material.dart';
import '../transaction/transactions.dart';
import 'chart_bar.dart';

// ignore: must_be_immutable
class Chart extends StatelessWidget {
  final List<String> _day = ['Mon', 'Tue', 'Wed', 'Thr', 'Fri', 'Sat', 'Sun'];
  final List<int> _indx = [0, 1, 2, 3, 4, 5, 6];
  List<double> sumOfTransactionsADay = [
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ]; //index 0 is monday
  double totalSum = 0;

  @override
  Widget build(BuildContext context) {
    for (Transaction trans in transactions) {
      if (trans.date.isAfter(DateTime.now().subtract(Duration(days: 7)))) {//sum it if it before one week
        sumOfTransactionsADay[trans.date.weekday - 1] += trans.price;
        totalSum += trans.price;
      }
    }
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(100),
          top: Radius.circular(15),
        ),
        color: Theme.of(context).primaryColor,
      ),
      child: Card(
        child: Row(
          children: <Widget>[
            ..._indx
                .map(
                  (int i) => Expanded(
                    child: Column(
                      children: [
                        FittedBox(
                          child: Text('\$${sumOfTransactionsADay[i]}'),
                        ),
                        ChartBar(
                          day: _day[i],
                          price: sumOfTransactionsADay[i],
                          totalSum: totalSum,
                        ),
                        Text(_day[i]),
                      ],
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
