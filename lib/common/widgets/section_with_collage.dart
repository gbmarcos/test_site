import 'package:flutter/material.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/common/widgets/common_widgets.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SectionWithImageCollage extends StatefulWidget {
  const SectionWithImageCollage({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  State<SectionWithImageCollage> createState() => _SectionWithImageCollageState();
}

class _SectionWithImageCollageState extends State<SectionWithImageCollage> {
  final visibilityNotifier = ValueNotifier<double>(1);

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

    return VisibilityDetector(
      key: const Key('SectionWithImageCollage'),
      onVisibilityChanged: (visibilityInfo) {
        final visibleBounds = visibilityInfo.visibleBounds;

        final normalizedFraction = visibilityInfo.normalizedFraction(context);

        if (!visibleBounds.isEmpty) {
          visibilityNotifier.value = visibleBounds.top > 0 ? 1 : normalizedFraction;
        }
      },
      child: ColoredBox(
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
                      widget.subtitle,
                      style: context.pageSubtitleStyle.copyWith(
                        color: const Color(0xFF414141),
                      ),
                    ),
                    Text(
                      widget.title,
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
                child: ValueListenableBuilder<double>(
                  valueListenable: visibilityNotifier,
                  builder: (context, value, _) {
                    return PhotoCollageWidget(
                      animationValue: value,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
