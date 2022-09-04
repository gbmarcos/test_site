import 'package:flutter/material.dart';

class FlexibleConstrainedBox extends StatelessWidget {
  const FlexibleConstrainedBox({
  super.key,
  required this.maxWidth,
  required this.child,
  this.flex = 1,
  });

  final int flex;
  final double maxWidth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
        ),
        child: child,
      ),
    );
  }
}