import 'package:flutter/material.dart';
import 'package:test_site/gen/assets.gen.dart';

class PhotoCollageWidget extends StatelessWidget {
  const PhotoCollageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const dividerSize = 20.0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 280,
          child: Assets.images.collage1.image(
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: dividerSize),
        SizedBox(
          height: 280,
          child: Row(
            children: [
              Expanded(
                child: Assets.images.collage2.image(
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: dividerSize),
              Expanded(
                child: Assets.images.collage3.image(
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: dividerSize),
        SizedBox(
          height: 560,
          child: Row(
            children: [
              Expanded(
                child: Assets.images.collage4.image(
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: dividerSize),
              Expanded(
                child: Assets.images.collage5.image(
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}