import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_test/detail_screen.dart';
import 'package:nasa_test/notifier/home_screen_notifier.dart';
import 'package:nasa_test/widgets/picture_row.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(nasaProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nasa Project'),
        ),
        body: SafeArea(
          child: state.when(
              data: (data) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.pictures.length,
                    itemBuilder: (context, index) {
                      return PictureRow(
                          picture: data.pictures[index], onTap: _navigate);
                    });
              },
              error: (error, stackTrace) {
                return Center(
                    child: Column(
                  children: [
                    const Text('Ops! Ocorreu um erro!'),
                    ElevatedButton(
                        onPressed: () => ref.refresh(nasaProvider),
                        child: const Text('Tentar novamente'))
                  ],
                ));
              },
              loading: () => const Center(child: CircularProgressIndicator())),
        ));
  }

  _navigate() {
    // TODO: pass NasaPicture as argument
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const DetailScreen(),
      ),
    );
  }
}
