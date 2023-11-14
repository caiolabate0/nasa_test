import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({super.key});

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nasa Project'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Nasa Project', style: TextStyle(fontSize: 50)),
            ElevatedButton(
                onPressed: () {
                  Modular.to.navigate('/list');
                },
                child: const Text('Check pictures list'))
          ],
        )));
  }
}
