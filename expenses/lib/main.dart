import 'package:flutter/material.dart';
import './models/Transaction.dart';
import 'package:intl/intl.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {

  final tittleController = TextEditingController();
  final valueController = TextEditingController();

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.deepPurple,
                child: Text('Gráfico'),
                elevation: 5,
              ),
            ),
            Column(
              children: _transaction.map((tr){
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ), 
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'R\$ ${tr.value.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color:  Colors. purple,
                          ),
                          ),
                      ),
                     Column(
                        crossAxisAlignment: CrossAxisAlignment.start ,
                        children: <Widget> [ 
                          Text(
                          tr.title.toString(),
                          style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          ) ,
                          ),
                          Text(
                          DateFormat('d MMM y').format(tr.date),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                          ),
                        ]
                      )
                    ],
                  )
                );
              }
              ).toList()
            ),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: tittleController,
                      decoration: InputDecoration(
                        labelText: 'Título',
                      ),
                    ),
                    TextField(
                      controller: valueController,
                       decoration: InputDecoration(
                      labelText: 'Valor (R\$)',
                       )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                          TextButton(
                          onPressed: () {
                            print(tittleController.text);
                            print(valueController.text);
                          },
                           child: Text(
                            'Nova Transação',
                            style: TextStyle(
                              color: Colors.purple,
                            ),
                           )
                           ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ]),
    );
  }
}
