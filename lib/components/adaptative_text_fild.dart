import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {

  final String? label;
  final TextEditingController? controller;
  final TextInputType? KeyboardType;
  final Function(String)? onSubmitted;
  AdaptativeTextField({
    this.label,
    this.controller,
    this.KeyboardType = TextInputType.text,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(

          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          child: CupertinoTextField(
            controller: controller,
            keyboardType: KeyboardType,
            onSubmitted: onSubmitted,
            placeholder: label,
            padding: EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 12,
            ),
              
          ),
        )
        : TextField(
            controller: controller,
            keyboardType: KeyboardType,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              labelText: label,
            ),
          );
  }
}
