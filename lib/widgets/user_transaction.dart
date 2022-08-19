import 'package:exense_tracker/widgets/new_transaction.dart';
import 'package:exense_tracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 't1', title: 'New Show', amount: 69.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'Weekly Grocery', amount: 16.49, date: DateTime.now()),
  ];

  void _addTransaction(String txTitle, double txAmount){
    final newTx = Transaction(id: DateTime.now().toString(), title: txTitle, amount: txAmount, date: DateTime.now());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addTx: _addTransaction),
        TransactionList(userTransactions: _userTransactions),
      ],
    );
  }
}
