import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final tittleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = tittleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0) {
      return;
    } else {
      widget.onSubmit(title, value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: tittleController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
                controller: valueController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
                decoration: InputDecoration(
                  labelText: 'Valor (R\$)',
                )),
            Container(
              height: 70,
              child: Row(
                children: [ 
                  Text('Nenhuma data selecionada!'),
                  TextButton(
                    child: Text(
                      'Selecionar Data',
                       style: TextStyle(
                        color: Colors.black,
                       ),),
                    onPressed: () {}, 
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: _submitForm,
                    child: Text(
                      'Nova Transação',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      )
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
