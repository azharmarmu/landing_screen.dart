import 'package:flutter/material.dart';

import 'widgets/error_body.dart';

class ErrorPage extends StatelessWidget {
  final String? message;

  const ErrorPage({
    Key? key,
    this.message = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ErrorBody(message: message ?? 'Error'),
    );
  }
}
