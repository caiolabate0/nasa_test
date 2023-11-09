import 'package:flutter/material.dart';
import 'package:nasa_test/model/nasa_pictures_state.dart';

class PictureRow extends StatelessWidget {
  final NasaPicture picture;
  final VoidCallback onTap;
  const PictureRow({super.key, required this.picture, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _PictureInfo(picture: picture),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}

class _PictureInfo extends StatelessWidget {
  final NasaPicture picture;
  const _PictureInfo({super.key, required this.picture});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: CircleAvatar(
              backgroundColor: Colors.black, child: Icon(Icons.image)),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(picture.title),
            Text(
              picture.date,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
