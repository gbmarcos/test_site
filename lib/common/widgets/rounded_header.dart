import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_site/r.dart';

enum _RoundedHeaderMode { search, backButton }

class RoundedHeader extends StatelessWidget {
  const RoundedHeader.search({
    super.key,
    required this.text,
    this.style,
  }) : _mode = _RoundedHeaderMode.search;

  const RoundedHeader.backButton({
    super.key,
    required this.text,
    this.style,
  }) : _mode = _RoundedHeaderMode.backButton;

  final String text;
  final TextStyle? style;
  final _RoundedHeaderMode _mode;

  @override
  Widget build(BuildContext context) {
    const iconColor = Colors.black;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color:  R.colors.roundedHeaderColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          if (_mode == _RoundedHeaderMode.backButton) ...[
            const Icon(
              Icons.arrow_back_ios_outlined,
              color: iconColor,
            ),
            const SizedBox(width: 30),
          ],
          Expanded(
              child: Text(
            text,
            style: style,
          )),
          if (_mode == _RoundedHeaderMode.search)
            const Icon(
              Icons.search,
              color: iconColor,
            ),
        ],
      ),
    );
  }
}
