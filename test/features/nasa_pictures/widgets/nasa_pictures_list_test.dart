import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_test/features/nasa_pictures/widgets/list/nasa_pictures_list.dart';
import 'package:nasa_test/features/nasa_pictures/model/nasa_pictures_state.dart';
import 'package:nasa_test/features/nasa_pictures/notifier/nasa_pictures_notifier.dart';

import 'setup_widget_test.dart';

void main() {
  Future<void> loadWidget(WidgetTester tester,
      {required Widget child, required NasaPicturesState state}) async {
    final widget = SetupWidgetTester(
      overrides: [
        nasaPictureNotifierProvider.overrideWith((ref, arg) => state),
      ],
      child: child,
    );
    await tester.pumpWidget(widget);
  }

  testWidgets(
    'WHEN NasaPicturesList is rendered and NasaPicturesState.pictures content is empty THEN must find a (nasaPicturesEmptyWidgetKey) and must NOT find a (nasaPicturesListWidgetKey)',
    (WidgetTester tester) async {
      await loadWidget(tester,
          child: const NasaPicturesList(),
          state: const NasaPicturesState(pictures: []));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('nasaPicturesHasDataKey')), findsOneWidget);
      expect(find.byKey(const Key('nasaPicturesListWidgetKey')), findsNothing);
      expect(
          find.byKey(const Key('nasaPicturesEmptyWidgetKey')), findsOneWidget);
    },
  );

  testWidgets(
    'WHEN NasaPicturesList is rendered and NasaPicturesState.pictures has content available THEN must find a (nasaPicturesListWidgetKey) and must NOT find a (nasaPicturesEmptyWidgetKey)',
    (WidgetTester tester) async {
      await loadWidget(tester,
          child: const NasaPicturesList(),
          state: const NasaPicturesState(pictures: [
            NasaPicture(
                id: 1,
                title: 'title',
                date: '2000-10-10',
                explanation: 'explanation',
                url: 'url')
          ]));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('nasaPicturesHasDataKey')), findsOneWidget);
      expect(
          find.byKey(const Key('nasaPicturesListWidgetKey')), findsOneWidget);
      expect(find.byKey(const Key('nasaPicturesEmptyWidgetKey')), findsNothing);
    },
  );
}
