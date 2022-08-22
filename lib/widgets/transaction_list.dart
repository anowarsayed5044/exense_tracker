import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';


class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTx;

  const TransactionList({required this.userTransactions, required this.deleteTx, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: userTransactions.isEmpty ? Column(
        children: [
          const Text("No Transaction Added Yet!"),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: Image.asset("assets/images/waiting.png", fit: BoxFit.cover,)
          ),
        ],
      )
          : ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(
              children: [
                IconButton(
                  onPressed: () => deleteTx(userTransactions[index].id),
                  icon: const Icon(Icons.delete, color: Colors.red,),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    '₹${userTransactions[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userTransactions[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd().format(userTransactions[index].date),
                      style: const TextStyle(
                          color: Colors.grey
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: userTransactions.length,
      ),
    );
  }
}
