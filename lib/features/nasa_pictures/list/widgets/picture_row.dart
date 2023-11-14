import 'package:flutter/material.dart';
import 'package:nasa_test/config/extension/date_extension.dart';
import 'package:nasa_test/features/nasa_pictures/model/nasa_pictures_state.dart';

class PictureRow extends StatelessWidget {
  final NasaPicture picture;
  final VoidCallback onTap;
  const PictureRow({super.key, required this.picture, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                      backgroundColor: Colors.black, child: Icon(Icons.image)),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(picture.title),
                      Text(
                        picture.date.convertToFormat() ?? '-',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
