import 'dart:math';

import 'package:expenses/models/Transaction.dart';
import 'package:flutter/material.dart';
import 'transaction_list.dart';
import 'transaction_form.dart';

class TransactionUser extends StatefulWidget {
  @override
  State<TransactionUser> createState() => TransactionUserState();
}

class TransactionUserState extends State<TransactionUser> {
  final _transaction = [
    Transaction(
        id: 't1',
        title: 'Novo Tênis de Corrida',
        value: 310.76,
        date: DateTime.now()),
    Transaction(
        id: 't20',
         title: 'Conta #01',
          value: 86.76,
           date: DateTime.now()),
    Transaction(
        id: 't2',
         title: 'Conta #02',
          value: 86.76,
           date: DateTime.now()),
    Transaction(
        id: 't3',
         title: 'Conta #03',
          value: 86.76,
           date: DateTime.now()),
    Transaction(
        id: 't4',
         title: 'Conta #04',
          value: 86.76,
           date: DateTime.now()),
       
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _transaction.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionForm(_addTransaction),
        Transactionlist(_transaction),
      ],
    );
  }
}
