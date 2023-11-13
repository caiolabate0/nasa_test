import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_test/config/nasa_module.dart';

void main() {
  runApp(ModularApp(
      module: NasaAppModule(), child: const ProviderScope(child: NasaApp())));
}

class NasaApp extends StatelessWidget {
  const NasaApp({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(Modular.initialRoute);
    return MaterialApp.router(
      title: 'Nasa App Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
