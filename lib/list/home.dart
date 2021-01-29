import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'custom_list_tile.dart';
import '../chart/chart.dart';
import '../transaction/transactions.dart';

class Home extends StatelessWidget {
  final Function deleteTransaction;
  Home(this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(8.0),
        child: transactions.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'No Transactions Added Yet!',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Image.asset(
                    'asset/images/waiting.png',
                    height: MediaQuery.of(context).size.height / 3,
                  ),
                ],
              )
            : Column(
                children: [
                  Chart(),
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemBuilder: (context, i) => CustomListTile(
                          title: transactions[i].title,
                          price: transactions[i].price,
                          id: i,
                          dateTime: transactions[i].date,
                          deleteTransaction: deleteTransaction,
                        ),
                        itemCount: transactions.length,
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
