import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:test_site/app/navigation/beamer_router.dart';
import 'package:test_site/common/widgets/common_widgets.dart';
import 'package:test_site/gen/assets.gen.dart';
import 'package:test_site/r.dart';

enum NavbarAnimationState { pending, done }

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({Key? key, this.onSelected}) : super(key: key);

  final void Function(NavigationOption page)? onSelected;

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => animationStateNotifier?.value = NavbarAnimationState.done,
    );
  }

  late final animationStateNotifier = Provider.of<ValueNotifier<NavbarAnimationState>?>(
    context,
    listen: false,
  );

  @override
  Widget build(BuildContext context) {
    //to close popup menu if it is open
    if (!Responsive.isMobile(context)) {
      Navigator.of(context).maybePop();
    }

    final isAnimationPending = (animationStateNotifier == null) ||
        (animationStateNotifier?.value == NavbarAnimationState.pending);

    return !Responsive.isMobile(context)
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 800,
              child: Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 8, right: 8, left: 8),
                child: AnimationLimiter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...List.generate(
                        NavigationOption.values.length,
                        (index) {
                          final page = NavigationOption.values[index];
                          final isLastPage = page == NavigationOption.values.last;
                          return CustomFadeAndSlideIn(
                            isAnimationPending: isAnimationPending,
                            position: index,
                            duration: const Duration(milliseconds: 450),
                            child: isLastPage
                                ? DestinationButtonWidget(
                                    text: NavigationOption.karriere.pageName,
                                    onTap: () {},
                                  )
                                : _DestinationTextWidget(
                                    text: page.pageName,
                                    onTap: () {
                                      widget.onSelected?.call(page);
                                    },
                                    selected: false,
                                  ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFadeAndSlideIn(
                  position: 0,
                  isAnimationPending: isAnimationPending,
                  duration: const Duration(milliseconds: 550),
                  child: PopupMenuButton(
                    icon: Assets.icons.menuButton.svg(
                      height: 24,
                      width: 24,
                      color: Colors.white,
                    ),
                    itemBuilder: (context) {
                      return List.generate(6, (index) {
                        final page = NavigationOption.values[index];
                        return PopupMenuItem<NavigationOption>(
                          onTap: () {
                            widget.onSelected?.call(page);
                          },
                          child: Text(
                            page.pageName,
                            style: TextStyle(
                              color: R.colors.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: Responsive.isDesktop(context) ? 16.0 : 14.0,
                              shadows: [
                                Shadow(
                                    color: Colors.black.withAlpha(50),
                                    blurRadius: 1.5,
                                    offset: const Offset(0, 2))
                              ],
                            ),
                          ),
                        );
                      });
                    },
                    elevation: 5,
                    color: Colors.grey.shade900.withOpacity(0.95),
                  ),
                ),
                CustomFadeAndSlideIn(
                  position: 0,
                  isAnimationPending: isAnimationPending,
                  duration: const Duration(milliseconds: 550),
                  child: DestinationButtonWidget(
                    horizontalMargin: 0,
                    horizontalPadding: 14,
                    text: NavigationOption.karriere.pageName,
                    onTap: () {},
                  ),
                )
              ],
            ),
          );
  }
}

class CustomFadeAndSlideIn extends StatelessWidget {
  const CustomFadeAndSlideIn({
    Key? key,
    required this.isAnimationPending,
    required this.child,
    required this.duration,
    required this.position,
  }) : super(key: key);

  final bool isAnimationPending;
  final Widget child;
  final Duration duration;
  final int position;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: position,
      duration: duration,
      child: ConditionalParentWidget(
        condition: isAnimationPending,
        conditionalBuilder: (child) => SlideAnimation(
          verticalOffset: -20,
          curve: Curves.decelerate,
          child: child,
        ),
        child: ConditionalParentWidget(
          condition: isAnimationPending,
          conditionalBuilder: (child) => FadeInAnimation(
            curve: Curves.decelerate,
            child: child,
          ),
          child: child,
        ),
      ),
    );
  }
}

class _DestinationTextWidget extends StatelessWidget {
  const _DestinationTextWidget({
    Key? key,
    required this.text,
    required this.onTap,
    required this.selected,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final fontSize = Responsive.isDesktop(context) ? 16.0 : 14.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: R.colors.primaryColor,
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : null,
            fontWeight: FontWeight.w600,
            fontSize: fontSize,
            shadows: [
              Shadow(color: Colors.black.withAlpha(50), blurRadius: 1.5, offset: const Offset(0, 2))
            ],
          ),
        ),
      ),
    );
  }
}

class DestinationButtonWidget extends StatelessWidget {
  const DestinationButtonWidget({
    Key? key,
    required this.text,
    required this.onTap,
    this.selected = false,
    this.horizontalPadding = 27,
    this.horizontalMargin = 8,
    this.backgroundColor,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    this.opacity = 0.8,
    this.elevation = 3,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final bool selected;
  final double horizontalPadding;
  final double horizontalMargin;
  final Color? backgroundColor;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double opacity;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final defaultFontSize = Responsive.isDesktop(context) ? 16.0 : 12.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: (selected ? Colors.white : (backgroundColor ?? R.colors.buttonColor))
              .withOpacity(opacity),
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(2)),
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 18),
          elevation: elevation,
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? R.colors.backgroundColor,
            fontWeight: fontWeight ?? R.fontWidths.semiBold,
            overflow: TextOverflow.ellipsis,
            fontSize: fontSize ?? defaultFontSize,
          ),
        ),
      ),
    );
  }
}
