import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'transaction_from.dart';

class AdaptativeButton extends StatelessWidget {
  final String? label;
  final Function()? onPressed;

  AdaptativeButton({
    this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label!),
            onPressed: onPressed,
            
            color: Theme.of(context).primaryColor,
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              //primary: Colors.purple[300],
              textStyle: Theme.of(context).textTheme.button,
            ),
            child: Text(label!),
            onPressed:onPressed,
            
          );
  }
}
