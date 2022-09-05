import 'package:flutter/material.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/r.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.darkMode = false,
    required this.hintText,
    this.textStyle,
  })  : options = const [],
        isDropdown = false;

  const CustomTextField.dropdown({
    super.key,
    this.darkMode = false,
    required this.options,
    this.textStyle,
  })  : hintText = '',
        isDropdown = true;

  final String hintText;
  final bool darkMode;
  final List<String> options;
  final bool isDropdown;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final textStyle = this.textStyle ??
       context.mainStyle2.copyWith(
          shadows: [],
          color: const Color(0XFF6F6F6F),
        );

    final decoration = InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: darkMode ? Colors.white : Colors.black),
      ),
      hintStyle: textStyle,
    );

    return isDropdown
        ? DropdownButtonFormField<String>(
            isExpanded: true,
            dropdownColor: darkMode ? ThemeData.dark().dialogBackgroundColor : null,
            icon: const Icon(Icons.keyboard_arrow_down),
            decoration: decoration,
            value: options.isNotEmpty ? options.first : null,
            items: options
                .map(
                  (opt) => DropdownMenuItem<String>(
                    value: opt,
                    child: Text(
                      opt,
                      style: textStyle.copyWith(
                        color: darkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {},
          )
        : TextFormField(
            style: textStyle.copyWith(
              shadows: [],
              color: darkMode ? Colors.white : Colors.black,
            ),
            decoration: decoration.copyWith(
              hintText: hintText,
            ),
          );
  }
}
