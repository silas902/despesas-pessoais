import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  Text(
                    'Nemhuma Transação Cadastrada!',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView(
            children: transactions.map((tr) {
              return TransactionItem(
                key: ValueKey(tr.id),
                tr: tr,
                onRemove: onRemove,
              );
            }).toList(),
          );
    //ListView.builder(
    //    itemCount: transactions.length,
    //    itemBuilder: (ctx, index) {
    //      final tr = transactions[index];
    //      return TransactionItem(tr: tr, onRemove: onRemove);
    //    },
    //  );
  }
}
