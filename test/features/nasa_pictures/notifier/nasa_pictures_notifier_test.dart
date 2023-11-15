import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_test/features/nasa_pictures/model/nasa_pictures_state.dart';
import 'package:nasa_test/features/nasa_pictures/notifier/nasa_pictures_notifier.dart';

void main() {
  test(
      'WHEN nasaPictureNotifierProvider is called THEN first AsyncValue state should be loading',
      () {
    final container = ProviderContainer(
      overrides: [
        nasaPictureNotifierProvider(const NasaArguments(interval: 5))
      ],
    );
    expect(
      container
          .read(nasaPictureNotifierProvider(const NasaArguments(interval: 5))),
      equals(const AsyncValue<NasaPicturesState>.loading()),
    );
    addTearDown(container.dispose);
  });
}
