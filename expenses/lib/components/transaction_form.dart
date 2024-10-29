import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _tittleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now(); 

  _submitForm() {
    final title = _tittleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0) {
      return;
    } else {
      widget.onSubmit(title, value);
    }
  }

  _showDatePicker() {
    showDatePicker(
            context: context,
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if(pickedDate == null){
        return;
      }

      setState(() {
         _selectedDate = pickedDate;
      });
    });
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
              controller: _tittleController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
                controller: _valueController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
                decoration: InputDecoration(
                  labelText: 'Valor (R\$)',
                )),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text( _selectedDate ==null ?
                     'Nenhuma data selecionada!' :
                     DateFormat('d/M/y').format(_selectedDate),
                     ),
                  ),
                  TextButton(
                    child: Text(
                      'Selecionar Data',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onPressed: _showDatePicker,
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
                    child: Text('Nova Transação',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
