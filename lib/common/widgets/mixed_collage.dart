import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/common/widgets/common_widgets.dart';
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
      child: Text(
        text1,
        style: context.normalStyle,
        textAlign: TextAlign.start,
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
      child: Text(
        text2,
        style: context.normalStyle,
        textAlign: TextAlign.start,
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
