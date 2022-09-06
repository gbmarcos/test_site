import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
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
    final fieldSeparator = SizedBox(
      height: Responsive.isDesktop(context) ? 40.0 : 25.0,
    );

    final finalTextFont = Responsive.isDesktop(context) ? 24.0 : 14.0;

    const vornameTextField = CustomTextField(
      hintText: 'Vorname',
    );
    const emailInputElementTextField = CustomTextField(
      hintText: 'E-Mail',
    );

    const hitTestResultTextField = CustomTextField(
      hintText: 'Ihre Nachricht',
    );
    const nachNameTextField = CustomTextField(
      hintText: 'Nachname',
    );
    const dropDTextField = CustomTextField.dropdown(
      options: ['Dienstleisungen1', 'Dienstleisungen2'],
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
              style: context.pageTitleStyle.copyWith(
                color: Colors.black,
                fontSize: Responsive.isDesktop(context) ? 40 : null,
              ),
            ),
            const SizedBox(height: 50),
            if (Responsive.isMobile(context))
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  vornameTextField,
                  fieldSeparator,
                  emailInputElementTextField,
                  fieldSeparator,
                  hitTestResultTextField,
                  fieldSeparator,
                  nachNameTextField,
                  fieldSeparator,
                  vornameTextField,
                  fieldSeparator,
                  dropDTextField,
                ],
              )
            else
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        vornameTextField,
                        fieldSeparator,
                        emailInputElementTextField,
                        fieldSeparator,
                        hitTestResultTextField,
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        nachNameTextField,
                        fieldSeparator,
                        vornameTextField,
                        fieldSeparator,
                        dropDTextField,
                      ],
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 36),
            CustomCheckButton(
              text: 'Ich stimme den AGBs zu.',
              textStyle: context.normalStyle.copyWith(
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
              child: ConstrainedBox(
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
            ),
            const SizedBox(height: 44),
            const Align(
              child: SocialMediaList(
                color: Color(0XFFB1D9C0),
              ),
            ),
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
    final separatorSize = Responsive.isDesktop(context) ? 20.0 : 15.0;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Assets.icons.instagramIcon.svg(
          height: 15,
          width: 15,
          color: color,
        ),
        SizedBox(width: separatorSize),
        Assets.icons.linkedInIcon.svg(
          height: 15,
          width: 15,
          color: color,
        ),
        SizedBox(width: separatorSize),
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
