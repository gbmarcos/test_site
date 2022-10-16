import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomSlideAndFadeAnimatedText extends StatefulWidget {
  const CustomSlideAndFadeAnimatedText(
    this.text, {
    super.key,
    this.onEnd,
    this.style,
    this.textAlign,
    this.startAnimation = true,
    this.maxLine,
  });

  final String text;
  final TextStyle? style;
  final VoidCallback? onEnd;
  final TextAlign? textAlign;
  final bool startAnimation;
  final int? maxLine;

  @override
  State<CustomSlideAndFadeAnimatedText> createState() => _CustomSlideAndFadeAnimatedTextState();
}

class _CustomSlideAndFadeAnimatedTextState extends State<CustomSlideAndFadeAnimatedText>
    with SingleTickerProviderStateMixin {
  late final typingProgressNotifier = ValueNotifier<int>(0);

  late final characters = widget.text.characters.toList();

  static const _initialDelayTime = Duration(milliseconds: 50);
  static const _itemSlideTime = Duration(milliseconds: 150);
  static const _staggerTime = Duration(milliseconds: 50);

  late final _animationDuration =
      _initialDelayTime + (_staggerTime * characters.length) + _itemSlideTime;

  late AnimationController _staggeredController;

  final List<Interval> _itemSlideIntervals = [];

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _createAnimationIntervals();

    _staggeredController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            widget.onEnd?.call();
          }
        },
      );
  }

  @override
  void didUpdateWidget(covariant CustomSlideAndFadeAnimatedText oldWidget) {
    log(widget.startAnimation.toString());
    if (widget.startAnimation && _staggeredController.value == 0) {
      _staggeredController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  void _createAnimationIntervals() {
    for (var i = 0; i < characters.length; ++i) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text.rich(
          TextSpan(
            style: widget.style?.copyWith(
              shadows: [],
              color: Colors.transparent,
            ),
            children: characters
                .take(typingProgressNotifier.value)
                .map(
                  (char) => TextSpan(
                    text: char,
                  ),
                )
                .toList(),
          ),
          textAlign: widget.textAlign,
          maxLines: widget.maxLine,
        ),
        ...List.generate(
          characters.length,
          (spanIndex) => AnimatedBuilder(
            animation: _staggeredController,
            builder: (context, child) {
              final animationPercent = Curves.easeOut.transform(
                _itemSlideIntervals[spanIndex].transform(_staggeredController.value),
              );
              final opacity = animationPercent;
              final slideDistance = (1.0 - animationPercent) * 20;

              return Opacity(
                opacity: opacity,
                child: Transform.translate(
                  offset: Offset(slideDistance, 0),
                  child: Text.rich(
                    TextSpan(
                      style: widget.style,
                      children: List.generate(
                        characters.length,
                        (charIndex) => TextSpan(
                          text: characters[charIndex],
                          style: charIndex != spanIndex
                              ? const TextStyle(color: Colors.transparent, shadows: [])
                              : null,
                        ),
                      ),
                    ),
                    textAlign: widget.textAlign,
                    maxLines: widget.maxLine,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CustomFadeAndSlideIn extends StatelessWidget {
  const CustomFadeAndSlideIn({
    Key? key,
    required this.child,
    required this.duration,
    required this.position,
  }) : super(key: key);

  final Widget child;
  final Duration duration;
  final int position;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: position,
      duration: duration,
      child: SlideAnimation(
        horizontalOffset: 20,
        curve: Curves.decelerate,
        child: FadeInAnimation(
          curve: Curves.decelerate,
          child: child,
        ),
      ),
    );
  }
}
