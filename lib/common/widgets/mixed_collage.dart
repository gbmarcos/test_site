import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_site/r.dart';

class MixedCollage extends StatelessWidget {
  const MixedCollage({
    Key? key,
    required this.text1,
    required this.text2,
    required this.image1,
    required this.image2,
  }) : super(key: key);

  final String text1;
  final String text2;
  final ImageProvider image1;
  final ImageProvider image2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                text1,
                style: R.styles.lSNormalStyle,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(width: 120),
            Expanded(
              child: SizedBox(
                height: 300,
                child: Image(
                  image: image1,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 106),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                height: 300,
                child: Image(
                  image: image2,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 120),
            Expanded(
              child: Text(
                text2,
                style: R.styles.lSNormalStyle,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
