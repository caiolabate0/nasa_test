import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_test/config/extension/date_extension.dart';
import 'package:nasa_test/shared/nasa_pictures_view_mixin.dart';
import 'package:nasa_test/features/nasa_pictures/model/nasa_pictures_state.dart';

class NasaPicturesDetails extends ConsumerStatefulWidget {
  final NasaPicture args;
  const NasaPicturesDetails({super.key, required this.args});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NasaPicturesDetailsState();
}

class _NasaPicturesDetailsState extends ConsumerState<NasaPicturesDetails>
    with NasaPicturesViewMixin {
  @override
  Widget build(BuildContext context) {
    final NasaPicture image = widget.args;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Modular.to.pop(),
        ),
        title: const Text('Nasa Detail'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _ImageData(url: checkHdUrl(image)),
                  _TextInfo(title: 'Title:', value: image.title),
                  _TextInfo(
                      title: 'Date:',
                      value: image.date.convertToFormat() ?? '-'),
                  _TextInfo(title: 'Explanation:', value: image.explanation),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ImageData extends StatelessWidget {
  final String url;
  const _ImageData({required this.url});

  @override
  Widget build(BuildContext context) {
    return Image.network(url,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return const SizedBox(
            height: 100,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) => const _NoImage());
  }
}

class _TextInfo extends StatelessWidget {
  final String title;
  final String value;
  const _TextInfo({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Wrap(
        spacing: 10,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
          Text(value),
        ],
      ),
    );
  }
}

class _NoImage extends StatelessWidget {
  const _NoImage();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 100, child: Center(child: Icon(Icons.image)));
  }
}
