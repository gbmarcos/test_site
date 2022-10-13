import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_site/common/widgets/common_widgets.dart';
import 'package:test_site/r.dart';

enum _RoundedHeaderMode { search, backButton }

class RoundedHeader extends StatelessWidget {
  const RoundedHeader.search({
    super.key,
    required this.text,
    this.style,
  })  : _mode = _RoundedHeaderMode.search,
        onTap = null;

  const RoundedHeader.backButton({
    super.key,
    required this.text,
    this.style,
    this.onTap,
  }) : _mode = _RoundedHeaderMode.backButton;

  final String text;
  final TextStyle? style;
  final _RoundedHeaderMode _mode;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    const iconColor = Colors.black;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      height: Responsive.isDesktop(context) ? 62 : 48,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: R.colors.roundedHeaderColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          if (_mode == _RoundedHeaderMode.backButton) ...[
            InkWell(
              onTap: onTap,
              child: const Icon(
                Icons.arrow_back_ios_outlined,
                color: iconColor,
              ),
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
