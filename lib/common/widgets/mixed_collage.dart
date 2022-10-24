import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/common/widgets/common_widgets.dart';
import 'package:test_site/gen/fonts.gen.dart';

class MixedCollage extends StatelessWidget {
  const MixedCollage({
    Key? key,
    required this.text1Builder,
    required this.text2Builder,
    required this.image1,
    required this.image2,
  }) : super(key: key);

  final Widget Function(TextStyle style, TextAlign textAlign) text1Builder;
  final Widget Function(TextStyle style, TextAlign textAlign) text2Builder;
  final ImageProvider image1;
  final ImageProvider image2;

  @override
  Widget build(BuildContext context) {
    final horizontalSpace = Responsive.isDesktop(context) ? 120.0 : 62.0;

    final verticalSpace = Responsive.isMobile(context) ? 30.0 : 106.0;

    final imageHeight = Responsive.isDesktop(context)
        ? 300.0
        : Responsive.isTablet(context)
            ? 180.0
            : 395.0;

    final externalPaddingValue = Responsive.isDesktop(context)
        ? 0.0
        : Responsive.isTablet(context)
            ? 80.0
            : 30.0;

    final textWidget1 = Padding(
      padding: EdgeInsets.only(
        left: externalPaddingValue,
        right: Responsive.isMobile(context) ? externalPaddingValue : 0,
      ),
      child: text1Builder(
        context.normalStyle.copyWith(fontFamily: FontFamily.montserrat),
        TextAlign.start,
      ),
    );
    final imageWidget1 = SizedBox(
      height: imageHeight,
      child: Image(
        image: image1,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );

    final imageWidget2 = SizedBox(
      height: imageHeight,
      child: Image(
        image: image2,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
    final textWidget2 = Padding(
      padding: EdgeInsets.only(
        right: externalPaddingValue,
        left: Responsive.isMobile(context) ? externalPaddingValue : 0,
      ),
      child: text2Builder(
        context.normalStyle.copyWith(fontFamily: FontFamily.montserrat),
        TextAlign.start,
      ),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (Responsive.isMobile(context)) ...[
          imageWidget1,
          SizedBox(height: verticalSpace),
          textWidget1,
          SizedBox(height: verticalSpace),
          imageWidget2,
          SizedBox(height: verticalSpace),
          textWidget2,
        ] else ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: textWidget1,
              ),
              SizedBox(width: horizontalSpace),
              Expanded(
                child: imageWidget1,
              )
            ],
          ),
          SizedBox(height: verticalSpace),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: imageWidget2,
              ),
              SizedBox(width: horizontalSpace),
              Expanded(
                child: textWidget2,
              ),
            ],
          ),
        ],
      ],
    );
  }
}
