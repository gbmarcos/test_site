import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/common/widgets/common_widgets.dart';
import 'package:test_site/common/widgets/custom_text_field.dart';
import 'package:test_site/common/widgets/navbar.dart';
import 'package:test_site/gen/assets.gen.dart';
import 'package:test_site/r.dart';

class AppForm1 extends StatelessWidget {
  const AppForm1({super.key});

  @override
  Widget build(BuildContext context) {
    const fieldSeparator = SizedBox(
      height: 40,
    );
    return Container(
      padding: const EdgeInsets.only(
        top: 80,
        bottom: 32,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      alignment: Alignment.topLeft,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 757),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Kontakt',
              style: R.styles.lSPageTitleStyle.copyWith(
                color: Colors.black,
                fontSize: 40,
              ),
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      CustomTextField(
                        hintText: 'Vorname',
                      ),
                      fieldSeparator,
                      CustomTextField(
                        hintText: 'E-Mail',
                      ),
                      fieldSeparator,
                      CustomTextField(
                        hintText: 'Ihre Nachricht',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      CustomTextField(
                        hintText: 'Nachname',
                      ),
                      fieldSeparator,
                      CustomTextField(
                        hintText: 'Vorname',
                      ),
                      fieldSeparator,
                      CustomTextField.dropdown(
                        options: ['Dienstleisungen1', 'Dienstleisungen2'],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 36),
            CustomCheckButton(
              text: 'Ich stimme den AGBs zu.',
              textStyle: R.styles.lSNormalStyle.copyWith(
                color: const Color(0XFF6F6F6F),
                fontSize: 14,
                height: 1.3,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: DestinationButtonWidget(
                text: 'Absenden',
                onTap: () {},
                horizontalPadding: 19,
                horizontalMargin: 0,
                textColor: Colors.black,
              ),
            ),
            const SizedBox(
              height: 108,
            ),
            Align(
              alignment: Alignment.topRight,
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
                            style: R.styles.lSMainStyle2.copyWith(
                              shadows: [],
                              fontSize: 24,
                              color: R.colors.backgroundColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 26),
                        Flexible(
                          flex: 2,
                          child: Text(
                            'Datenschutz',
                            style: R.styles.lSMainStyle2.copyWith(
                              shadows: [],
                              fontSize: 24,
                              color: R.colors.backgroundColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 26),
                        Flexible(
                          flex: 1,
                          child: Text(
                            'AGB',
                            style: R.styles.lSMainStyle2.copyWith(
                              shadows: [],
                              fontSize: 24,
                              color: R.colors.backgroundColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 44),
                  const SocialMediaList(color: Color(0XFFB1D9C0)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SocialMediaList extends StatelessWidget {
  const SocialMediaList({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Assets.icons.instagramIcon.svg(
          height: 15,
          width: 15,
          color: color,
        ),
        const SizedBox(width: 20),
        Assets.icons.linkedInIcon.svg(
          height: 15,
          width: 15,
          color: color,
        ),
        const SizedBox(width: 20),
        Assets.icons.metaIcon.svg(
          height: 15,
          width: 73.75,
          color: color,
        ),
      ],
    );
  }
}

class AppForm2 extends StatelessWidget {
  const AppForm2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const fieldSeparator = SizedBox(
      height: 40,
    );

    return SizedBox(
      height: 538,
      child: Row(
        children: [
          Expanded(
            child: Assets.images.form2Image.image(
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              padding: const EdgeInsets.only(
                top: 56,
                left: 100,
                right: 100,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'RÜCKRUF SERVICE',
                      style: R.styles.lSPageTitleStyle.copyWith(
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  fieldSeparator,
                  const CustomTextField(
                    hintText: 'Name',
                    darkMode: true,
                  ),
                  fieldSeparator,
                  const CustomTextField(
                    hintText: 'Telefon',
                    darkMode: true,
                  ),
                  fieldSeparator,
                  const CustomTextField.dropdown(
                    options: ['Dienstleisungen1', 'Dienstleisungen2'],
                    darkMode: true,
                  ),
                  fieldSeparator,
                  Align(
                    alignment: Alignment.topRight,
                    child: DestinationButtonWidget(
                      text: 'Absenden',
                      onTap: () {},
                      horizontalPadding: 19,
                      textColor: Colors.black,
                      horizontalMargin: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppForm3 extends StatelessWidget {
  const AppForm3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style1 = TextStyle(
      fontWeight: R.fontWidths.medium,
      fontSize: 11,
    );

    final style2 = TextStyle(
      fontWeight: R.fontWidths.semiBold,
      fontSize: 11,
      color: Colors.black,
    );

    const fieldVerticalSeparator = SizedBox(
      height: 16,
    );

    const fieldHorizontalSeparator = SizedBox(
      width: 30,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                hintText: 'Vorname',
                textStyle: style1,
              ),
            ),
            fieldHorizontalSeparator,
            Expanded(
              child: CustomTextField(
                hintText: 'Nachname',
                textStyle: style1,
              ),
            ),
          ],
        ),
        fieldVerticalSeparator,
        CustomTextField(
          hintText: 'E-Mail',
          textStyle: style1,
        ),
        fieldVerticalSeparator,
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                hintText: 'ORT',
                textStyle: style1,
              ),
            ),
            fieldHorizontalSeparator,
            Expanded(
              child: CustomTextField(
                hintText: 'Telefon',
                textStyle: style1,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 28,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GEBURTSDATUM *',
                    style: style2,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  CustomTextField(
                    hintText: 'DD.MM.YY',
                    textStyle: style1,
                  ),
                ],
              ),
            ),
            fieldHorizontalSeparator,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GESCHLECHT',
                    style: style2,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  CustomTextField(
                    hintText: 'Bitte auswählen...',
                    textStyle: style1,
                  ),
                ],
              ),
            ),
          ],
        ),
        fieldVerticalSeparator,
        CustomTextField(
          hintText: 'VERFÜGBAR AB',
          textStyle: style1,
        ),
      ],
    );
  }
}
