import 'package:flutter/material.dart';

class FailureView extends StatelessWidget {
  final String message;

  const FailureView({Key? key, this.message = "Error desconocido"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message));
  }
}
