import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final double price;
  final DateTime dateTime;
  final int id;
  final Function(int index) deleteTransaction;
  CustomListTile({
    @required this.title,
    @required this.price,
    @required this.id,
    @required this.dateTime,
    @required this.deleteTransaction,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Theme.of(context).primaryColor,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).accentColor,
          radius: 30,
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '\$ ' + price.toStringAsFixed(2),
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(dateTime),
          style: Theme.of(context).textTheme.headline4,
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => deleteTransaction(id),
        ),
        isThreeLine: true,
      ),
    );
  }
}
