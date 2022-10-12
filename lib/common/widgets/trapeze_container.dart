import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TrapezeContainer extends StatelessWidget {
  const TrapezeContainer({
    Key? key,
    this.fillColor = Colors.grey,
     this.height,
     this.width,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final Color fillColor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: CustomPaint(
        painter: TrapezePainter(color: fillColor),
        child: Padding(
          padding: const EdgeInsets.all(10).copyWith(right: 96),
          child: child,
        ),
      ),
    );
  }
}

class TrapezePainter extends CustomPainter {
  TrapezePainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 10;

    final path = Path()
      ..moveTo(size.width, 0)
      ..lineTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width - (96), size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
