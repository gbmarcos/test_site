import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class CustomCheckButton extends StatefulWidget {
  const CustomCheckButton({
    super.key,
    this.iconColor = Colors.black,
    this.textStyle,
    this.iconSize = 14,
    this.spaceBetween = 18,
    required this.text,
  });

  final Color iconColor;
  final TextStyle? textStyle;
  final String text;
  final double iconSize;
  final double spaceBetween;

  @override
  _CustomCheckButtonState createState() => _CustomCheckButtonState();
}

class _CustomCheckButtonState extends State<CustomCheckButton> {
  late final ValueNotifier<bool> selectedNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectedNotifier.value = !selectedNotifier.value;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder<bool>(
              valueListenable: selectedNotifier,
              builder: (context, selected, _) => Icon(
                selected ? Icons.check_box_outlined : Icons.check_box_outline_blank_sharp,
                color: widget.iconColor,
                size: widget.iconSize,
              ),
            ),
            SizedBox(
              width: widget.spaceBetween,
            ),
            Expanded(
              child: Text(
                widget.text,
                style: widget.textStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
