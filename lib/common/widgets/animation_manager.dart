import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_site/common/widgets/common_widgets.dart';
import 'package:test_site/screens/screens.dart';

class AnimationManager extends StatelessWidget {
  const AnimationManager({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ValueNotifier(MainContentAnimationState.pending),
        ),
        ChangeNotifierProvider(
          create: (_) => ValueNotifier(NavbarAnimationState.pending),
        ),
      ],
      child: child,
    );
  }
}
