// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import 'base_dialog.dart';

const TITLE = 'Antes de continuar';
const NO_BUTTON = 'Cancelar';
const YES_BUTTON = 'Confirmar';

class WarningDialog extends StatelessWidget {
  final List<String> contents;
  final VoidCallback action;

  const WarningDialog({
    Key? key,
    required this.contents,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: TITLE,
      color: Color(0xFFf0696c),
      actions: <Widget>[
        OutlinedButton(
          child: const Text(NO_BUTTON),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: const Text(YES_BUTTON),
          onPressed: action,
        ),
      ],
      contents: contents,
    );
  }
}
