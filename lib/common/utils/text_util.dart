import 'package:flutter/cupertino.dart';

InlineSpan bulledText(
  String text, {
  TextStyle? style,
}) {
  return WidgetSpan(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(' • ', style: style), Expanded(child: Text('$text', style: style))],
    ),
  );
}
