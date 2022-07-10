import 'package:flutter/material.dart';

class BaseDialog extends StatelessWidget {
  final String title;
  final Color color;
  final List<Widget> actions;
  final List<String> contents;

  const BaseDialog({
    Key? key,
    required this.title,
    required this.color,
    required this.actions,
    required this.contents,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borders = 15.0;
    return AlertDialog(
      titlePadding: const EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(borders)),
      ),
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(borders),
            topRight: Radius.circular(borders),
          ),
        ),
        child: Text(title),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            for (String c in contents) Text(c),
            const SizedBox(height: 10),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: actions,
    );
  }
}
