import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  NewTransaction({required this.addTx, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: "enter Title",
            ),
            controller: titleController,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: "enter Amount",
            ),
            keyboardType: TextInputType.number,
            controller: amountController,
          ),
          FlatButton(
            onPressed: () {
              addTx(titleController.text, double.parse(amountController.text));
              Navigator.of(context).pop();
            },
            textColor: Colors.purple,
            child: const Text("Add Transaction"),
          ),
        ],
      ),
    );
  }
}
