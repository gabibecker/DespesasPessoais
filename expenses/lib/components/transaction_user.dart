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
        id: 't2', title: 'Conta de luz', value: 86.76, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Transactionlist(_transaction),
        TransactionForm(),
      ],
    );
  }
}
