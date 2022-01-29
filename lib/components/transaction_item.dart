import 'dart:math';

import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  final Transaction tr;
  final void Function(String ) onRemove;

  const TransactionItem({
    Key? key,
    required this.tr,
    required this.onRemove,
  }) : super(key: key);

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {

  static const colors = [
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.blue,
    Colors.black,
  ];

  Color? _backgroundColor;
  @override
  void initState(){
    super.initState();

    int i = Random().nextInt(5);
    _backgroundColor = colors[i];
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _backgroundColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
                child: Text(
              'R\$${widget.tr.value}',
              style: const TextStyle(color: Colors.white),
            )),
          ),
        ),
        title: Text(
          widget.tr.title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(widget.tr.date),
        ),
        trailing: MediaQuery.of(context).size.width > 400
      ? TextButton.icon(
          onPressed: () => widget.onRemove(widget.tr.id),
          icon: Icon(Icons.delete),
          label: Text(
            'Exicluir',
            style: TextStyle(
              color: Theme.of(context).errorColor,
            ),
          ),
        )
      : IconButton(
          onPressed: () => widget.onRemove(widget.tr.id),
          color: Theme.of(context).errorColor,
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}
