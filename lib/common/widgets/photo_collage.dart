import 'package:flutter/material.dart';
import 'package:test_site/common/widgets/common_widgets.dart';
import 'package:test_site/gen/assets.gen.dart';

class PhotoCollageWidget extends StatelessWidget {
  const PhotoCollageWidget({super.key, this.animationValue = 1});

  final double animationValue;

  @override
  Widget build(BuildContext context) {
    final dividerSize = Responsive.isDesktop(context)
        ? 20.0
        : Responsive.isTablet(context)
            ? 14.0
            : 8.0;

    final heightFactor = Responsive.isDesktop(context)
        ? 280.0
        : Responsive.isTablet(context)
            ? 184.0
            : 94.0;

    final maxHorizontalTranslate = Responsive.isMobile(context) ? 70 : 120;

    final translateProgress = maxHorizontalTranslate - (maxHorizontalTranslate * animationValue);

    return Opacity(
      opacity: animationValue,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.translate(
            offset: Offset(-translateProgress, 0),
            child: SizedBox(
              height: heightFactor,
              child: Assets.images.collage1.image(
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: dividerSize),
          Transform.translate(
            offset: Offset(translateProgress, 0),
            child: SizedBox(
              height: heightFactor,
              child: Row(
                children: [
                  Expanded(
                    child: Assets.images.collage2.image(
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: dividerSize),
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
          ),
          SizedBox(height: dividerSize),
          Transform.translate(
            offset: Offset(-translateProgress, 0),
            child: SizedBox(
              height: heightFactor * 2,
              child: Row(
                children: [
                  Expanded(
                    child: Assets.images.collage4.image(
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: dividerSize),
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
          ),
        ],
      ),
    );
  }
}
