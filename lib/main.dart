import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'constants.dart';
import 'transaction/transactions.dart';
import 'list/home.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime datePicked;
  PreferredSizeWidget appBar () => Platform.isIOS ?
        CupertinoNavigationBar(
          middle: Text('Expenses'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: () => Builder(
                  builder: (BuildContext context) => IconButton(
                  icon: Icon(CupertinoIcons.add),
                  onPressed: () => bottomSheet(context),
                  ),
                ),
              )
            ]
          ),
        ).preferredSize
        : AppBar(
          title: Text('Expenses'),
          actions: [
            Builder(
              builder: (BuildContext context) => IconButton(
                icon: Icon(
                  Icons.add,
                ),
                onPressed: () => bottomSheet(context),
              ),
            ),
          ],
        );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'personal_expenses',
      home: Platform.isIOS ? 
        CupertinoPageScaffold(child: Home(deleteTransaction), navigationBar: appBar(),)
      : Scaffold(
        appBar: appBar(),
        body: Home(deleteTransaction),
        floatingActionButton: Platform.isIOS ? 
        Container()
        : Builder(
          builder: (BuildContext context) => FloatingActionButton(
            onPressed: () => bottomSheet(context),
            child: Icon(Icons.add),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
      theme: baseTheme(),
    );
  }

  void addTransaction(String title, double price, DateTime datePicked) => setState(() => transactions
          .add(Transaction(title: title, price: price, date: datePicked)));

  void deleteTransaction(int index) => setState(() => transactions.removeAt(index));

  void datePicker(BuildContext context) => showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget widget) => Theme(
        child: widget,
        data: ThemeData.light().copyWith(
          colorScheme: ColorScheme.light(
            primary: Theme.of(context).primaryColor,
          ),
        ),
      ),
    ).then((picker) {
      if (picker == null) return;
      setState(() {
        datePicked = picker;
      });
    });

  void bottomSheet(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                autofocus: true,
                controller: titleController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: Theme.of(context).textTheme.headline3,
                  enabledBorder: sTextFieldBorder,
                  focusedBorder: sTextFieldBorder,
                ),
              ),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Price',
                  labelStyle: Theme.of(context).textTheme.headline3,
                  enabledBorder: sTextFieldBorder,
                  focusedBorder: sTextFieldBorder,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      datePicked == null
                          ? 'No Date Chosen!'
                          : DateFormat.yMMMd().format(datePicked),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Builder(
                    builder: (BuildContext context) => FlatButton(
                      child: Text(
                        'Choose Date',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      onPressed: () => datePicker(context),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              RaisedButton(
                child: Text(
                  'Add Transaction',
                  style: Theme.of(context).textTheme.headline6,
                ),
                onPressed: () {
                  if (titleController.text != '' &&
                      priceController.text != '' &&
                      datePicked != null)
                    addTransaction(
                      titleController.text,
                      double.parse(priceController.text),
                      datePicked,
                    );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
