import 'package:flutter/material.dart';
import '../models/Transaction.dart';
import 'package:intl/intl.dart';

class Transactionlist extends StatelessWidget {
  final List<Transaction> transactions;

  Transactionlist(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transactions.isEmpty
            ? Column(
                children: [
                  Text('Nenhuma Transação Cadastrada!',
                      style: TextStyle(
                          color:
                              Theme.of(context).textTheme.titleMedium?.color)),
                  SizedBox(height: 20),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png', //mostrar o caminho da imagem
                      fit: BoxFit
                          .cover, //ajustar o tam. da imagem relativa ao tam
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (ctx, index) {
                  final tr = transactions[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: FittedBox(child: Text('R\$${tr.value}')),
                        ),
                      ),
                      title: Text(
                        tr.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      subtitle: Text(DateFormat('d MMM y').format(tr.date)),
                    ),
                  );
                }));
  }
}
