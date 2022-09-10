import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/common/widgets/common_widgets.dart';

class MainTextAnimation extends StatelessWidget {
  const MainTextAnimation({
    Key? key,
    required this.isAnimationPending,
    required this.text,
  }) : super(key: key);

  final bool isAnimationPending;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.synchronized(
      duration: const Duration(milliseconds: 800),
      child: ConditionalParentWidget(
        condition: isAnimationPending,
        conditionalBuilder: (child) => SlideAnimation(
          verticalOffset: 50,
          curve: Curves.decelerate,
          child: child,
        ),
        child: ConditionalParentWidget(
          condition: isAnimationPending,
          conditionalBuilder: (child) => FadeInAnimation(
            curve: Curves.decelerate,
            child: child,
          ),
          child: Text(
            text,
            style: context.mainStyle1,
            textAlign: context.mainPageTextAlign,
          ),
        ),
      ),
    );
  }
}