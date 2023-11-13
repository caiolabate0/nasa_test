import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String error;
  final VoidCallback onRefresh;
  const ErrorPage({super.key, required this.error, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(error),
          ElevatedButton(onPressed: onRefresh, child: const Text('Try again'))
        ],
      )),
    );
  }
}
