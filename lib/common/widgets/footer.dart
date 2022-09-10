import 'package:flutter/material.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/common/widgets/common_widgets.dart';
import 'package:test_site/r.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final finalTextFont = Responsive.isDesktop(context) ? 24.0 : 14.0;

    return ColoredBox(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  flex: 2,
                  child: Text(
                    'Impressum',
                    style: context.mainStyle2.copyWith(
                      shadows: [],
                      fontSize: finalTextFont,
                      color: R.colors.backgroundColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 22),
                Flexible(
                  flex: 2,
                  child: Text(
                    'Datenschutz',
                    style: context.mainStyle2.copyWith(
                      shadows: [],
                      fontSize: finalTextFont,
                      color: R.colors.backgroundColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 22),
                Flexible(
                  flex: 1,
                  child: Text(
                    'AGB',
                    style: context.mainStyle2.copyWith(
                      shadows: [],
                      fontSize: finalTextFont,
                      color: R.colors.backgroundColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 44),
          const SocialMediaList(
            color: Color(0XFFB1D9C0),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
