import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SetupWidgetTester extends StatelessWidget {
  //Widget to be tested
  final Widget child;

  //List of providers to override
  final List<Override>? overrides;

  const SetupWidgetTester({
    Key? key,
    required this.child,
    this.overrides,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [...overrides ?? []],
      child: MaterialApp(
        home: Material(
          child: MediaQuery(
            data: const MediaQueryData(),
            child: child,
          ),
        ),
      ),
    );
  }
}

Future<void> loadPage(WidgetTester tester, Widget child) async {
  var widget = SetupWidgetTester(child: child);
  await tester.pumpWidget(widget);
}
