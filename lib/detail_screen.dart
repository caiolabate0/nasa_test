import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nasa_test/model/nasa_response.dart';
import 'package:nasa_test/widgets/picture_row.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // final DioClient client = DioClient(_client);

  final dio = Dio();
  String image = '';
  String explanation = 'Loading explanation....';

  _get() async {
    final response = await dio.get(
        'https://api.nasa.gov/planetary/apod?api_key=zRht1hivkbkEvnDK9FNgcdlVCe98stWBvRU9Jjh7');
    print('response-- ${response.runtimeType}');
    print('response-- ${response.data}');
    final NasaResponse data = NasaResponse.fromJson(response.data);
    print(data.url);
    // setState(() {
    //   image = data.url;
    //   explanation = data.explanation;
    // });
  }

  @override
  void initState() {
    _get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nasa Detail'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image.isEmpty) const CircularProgressIndicator(),
              if (image.isNotEmpty)
                Image.network(
                  image,
                  // errorBuilder: (context, error, stackTrace) => Container(child: Text('IMAGE'),),
                ),
              Text(explanation),
            ],
          ),
        ),
      ),
    );
  }
}
