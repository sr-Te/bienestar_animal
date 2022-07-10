// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import 'base_dialog.dart';

const TITLE = 'Oops, algo anda mal';
const BUTTON = 'OK';

class ErrorDialog extends StatelessWidget {
  final List<String> contents;

  const ErrorDialog({
    Key? key,
    required this.contents,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: TITLE,
      color: Colors.red,
      actions: <Widget>[
        ElevatedButton(
          child: const Text(BUTTON),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
      contents: contents,
    );
  }
}
