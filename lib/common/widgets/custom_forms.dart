import 'package:flutter/material.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/common/widgets/common_widgets.dart';
import 'package:test_site/gen/assets.gen.dart';
import 'package:test_site/r.dart';

class AppForm1 extends StatelessWidget {
  const AppForm1

  ({super.key});

  @override
  Widget build(BuildContext context) {
    final fieldSeparator = SizedBox(
      height: Responsive.isDesktop(context) ? 40.0 : 25.0,
    );

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
      options: [
        'Unternehmensberatung',
        'Rückabwicklung',
        'Investment & Vermögensschutz',
      ],
    );

    return Container(
      padding: const EdgeInsets.only(
        top: 80,
        bottom: 108,
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
                  nachNameTextField,
                  fieldSeparator,
                  hitTestResultTextField,
                  fieldSeparator,
                  emailInputElementTextField,
                  fieldSeparator,
                  dropDTextField,
                ],
              )
            else
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
    final fieldSeparator = SizedBox(
      height: Responsive.isDesktop(context) ? 40.0 : 25.0,
    );

    final formHeight = Responsive.isDesktop(context) ? 538.0 : 355.0;

    final titleSize = Responsive.isDesktop(context) ? 32.0 : 20.0;

    final padding = Responsive.isDesktop(context)
        ? const EdgeInsets.only(
      top: 56,
      left: 100,
      right: 100,
    )
        : Responsive.isTablet(context)
        ? const EdgeInsets.only(
      top: 28,
      left: 60,
      right: 60,
    )
        : const EdgeInsets.only(
      top: 28,
      left: 40,
      right: 40,
    );

    final form = Container(
      color: Colors.black,
      padding: padding,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'RÜCKRUF SERVICE',
              style: context.pageTitleStyle.copyWith(
                fontSize: titleSize,
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
            options: [
              'Unternehmensberatung',
              'Rückabwicklung',
              'Investment & Vermögensschutz',
            ],
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
    );

    return Responsive.isMobile(context)
        ? Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Assets.images.form2Image.image(
          width: double.infinity,
          height: 320,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: formHeight,
          child: form,
        ),
      ],
    )
        : SizedBox(
      height: formHeight,
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
            child: form,
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

    final fieldVerticalSeparator = SizedBox(
      height: Responsive.isDesktop(context)
          ? 16
          : 8,
    );

    const fieldHorizontalSeparator = SizedBox(
      width: 30,
    );

    final vornameField = CustomTextField(
      hintText: 'Vorname',
      textStyle: style1,
    );
    final nachnameField = CustomTextField(
      hintText: 'Nachname',
      textStyle: style1,
    );
    final emailField = CustomTextField(
      hintText: 'E-Mail',
      textStyle: style1,
    );
    final ortField = CustomTextField(
      hintText: 'ORT',
      textStyle: style1,
    );
    final telefonField = CustomTextField(
      hintText: 'Telefon',
      textStyle: style1,
    );
    final dateField = Column(
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
    );
    final bitteAuswahlenField = Column(
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
    );
    final verfugbarField = CustomTextField(
      hintText: 'VERFÜGBAR AB',
      textStyle: style1,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!Responsive.isMobile(context))
          Row(
            children: [
              Expanded(
                child: vornameField,
              ),
              fieldHorizontalSeparator,
              Expanded(
                child: nachnameField,
              ),
            ],
          )
        else
          ...[
            vornameField,
            fieldVerticalSeparator,
            nachnameField,
          ],
        fieldVerticalSeparator,
        emailField,
        fieldVerticalSeparator,
        if (!Responsive.isMobile(context))
          Row(
            children: [
              Expanded(
                child: ortField,
              ),
              fieldHorizontalSeparator,
              Expanded(
                child: telefonField,
              ),
            ],
          )
        else
          ...[
            ortField,
            fieldVerticalSeparator,
            telefonField,
          ],
        const SizedBox(
          height: 28,
        ),
        if (!Responsive.isMobile(context))
          Row(
            children: [
              Expanded(
                child: dateField,
              ),
              fieldHorizontalSeparator,
              Expanded(
                child: bitteAuswahlenField,
              ),
            ],
          ) else
          ...[
            dateField,
            fieldVerticalSeparator,
            bitteAuswahlenField,
          ],
        fieldVerticalSeparator,
        verfugbarField,
      ],
    );
  }
}
