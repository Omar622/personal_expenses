import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double price;
  final double totalSum;
  ChartBar({
    @required this.day,
    @required this.price,
    @required this.totalSum,

  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 15,
      margin: EdgeInsets.symmetric(vertical: 6.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).accentColor,
          width: 1.8,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          totalSum.round() - price.round() == 0
              ? SizedBox(
                  width: 0,
                  height: 0,
                )
              : Expanded(
                  flex: totalSum.round() - price.round(),
                  child: Text(''),
                ),
          Expanded(
            flex: price.round(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
