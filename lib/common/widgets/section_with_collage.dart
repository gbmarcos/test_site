import 'package:flutter/material.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/common/widgets/common_widgets.dart';

class SectionWithImageCollage extends StatelessWidget {
  const SectionWithImageCollage({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.isDesktop(context)
        ? const EdgeInsets.only(
      left: 163,
      right: 163,
      top: 30,
      bottom: 58,
    )
        : Responsive.isTablet(context)
        ? const EdgeInsets.only(
      left: 50,
      right: 50,
      top: 26,
      bottom: 60,
    )
        : const EdgeInsets.only(
      top: 26,
      bottom: 33,
    );

    return ColoredBox(
      color: Colors.white,
      child: Container(
        padding: padding,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(left: Responsive.isMobile(context) ? 30 : 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    subtitle,
                    style: context.pageSubtitleStyle.copyWith(
                      color: const Color(0xFF414141),
                    ),
                  ),
                  Text(
                    title,
                    style: context.pageTitleStyle.copyWith(
                      fontSize: Responsive.isDesktop(context) ? null : 24,
                      color: const Color(0xFF414141),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Responsive.isMobile(context) ? 30 : 60,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1114,
              ),
              child: const PhotoCollageWidget(),
            )
          ],
        ),
      ),
    );
  }
}