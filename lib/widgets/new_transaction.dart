import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  const NewTransaction({required this.addTx, Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    void _presentDatePicker(){
      showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2022), lastDate: DateTime.now())
          .then((value) {
            if(value == null){
              return;
            }
            setState((){
              _selectedDate = value;
            });
      });
    }

    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: "enter Title",
                ),
                controller: _titleController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "enter Amount",
                ),
                keyboardType: TextInputType.number,
                controller: _amountController,
              ),
              Container(
                child: Row(children: [
                  Expanded(
                    child: Text('Selected Date: ${DateFormat.yMd().format(_selectedDate)}'),
                  ),
                  FlatButton(
                    onPressed: _presentDatePicker,
                    textColor: Theme.of(context).primaryColor,
                    child: const Text("Chose Date", style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ],),
              ),
              RaisedButton(
                onPressed: () {
                  widget.addTx(_titleController.text, double.parse(_amountController.text), _selectedDate);
                  Navigator.of(context).pop();
                },
                color: Colors.purple,
                child: const Text("Add Transaction", style: TextStyle(color: Colors.white70),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
