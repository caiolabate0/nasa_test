// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_test/features/nasa_pictures/model/nasa_pictures_state.dart';
import 'package:nasa_test/features/nasa_pictures/notifier/nasa_pictures_notifier.dart';
import 'package:nasa_test/features/nasa_pictures/list/widgets/picture_row.dart';
import 'package:nasa_test/shared/error_page.dart';

class NasaPicturesList extends ConsumerStatefulWidget {
  const NasaPicturesList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NasaPicturesListState();
}

class _NasaPicturesListState extends ConsumerState<NasaPicturesList> {
  TextEditingController controller = TextEditingController();
  int interval = 5;
  String? filter;

  Future<void> _refresh({bool loadMore = false}) {
    setState(() {
      if (loadMore) interval = interval + 5;
      filter = controller.text;
    });
    return Future.value();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(nasaPictureNotifierProvider(
        NasaArguments(interval: interval, filter: filter)));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nasa Pictures List'),
        ),
        body: SafeArea(
          child: state.when(
              data: (data) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 30),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: ("Search by name"),
                                  ),
                                  controller: controller,
                                ),
                              ),
                              SizedBox(
                                height: 55,
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: ElevatedButton(
                                  child: const Text("Search"),
                                  onPressed: () {
                                    _refresh();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data.pictures.length + 1,
                            itemBuilder: (context, index) {
                              return (index == data.pictures.length)
                                  ? ElevatedButton(
                                      child: const Text("Load More"),
                                      onPressed: () {
                                        _refresh(loadMore: true);
                                      },
                                    )
                                  : PictureRow(
                                      picture: data.pictures[index],
                                      onTap: () =>
                                          _seeDetails(data.pictures[index]));
                            }),
                      ],
                    ),
                  ),
                );
              },
              error: (error, stackTrace) {
                return ErrorPage(
                    error: 'Could not load pictures!',
                    onRefresh: () {
                      _refresh();
                    });
              },
              loading: () => const Center(child: CircularProgressIndicator())),
        ));
  }

  _seeDetails(NasaPicture picture) {
    Modular.to.pushNamed('/detail', arguments: picture);
  }
}
