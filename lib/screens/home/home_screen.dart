import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:test_site/r.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/gen/assets.gen.dart';
import 'package:test_site/screens/screens.dart';
import '../../common/widgets/navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = context.mediaQuery;
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: mediaQuery.size.height,
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    const Color(0xFF7D7A7A).withOpacity(0.7),
                    BlendMode.srcOver,
                  ),
                  image: Assets.images.homeImage1.image().image,
                  fit: BoxFit.cover,
                  scale: 1.3,
                ),
              ),
              child: Column(
                children: const [
                  Navbar(),
                  Expanded(
                    child: HomeFirstSectionContent(),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 80),
            decoration: BoxDecoration(
              color: Color.alphaBlend(
                R.colors.maskColor1.withOpacity(0.5),
                Colors.white,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Text(
                    'Wie viel Zeit ist genug Zeit?',
                    textAlign: TextAlign.center,
                    style: R.styles.lSPageTitleStyle.copyWith(color: R.colors.backgroundColor),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 922),
                    child: Text(
                      '''
Mit dieser Frage beschäftigen wir uns nun schon lange - und sie hat uns bisher nicht losgelassen.
Der Wunsch, unseren Mandanten mehr persönliche, berufliche und finanzielle Freiheit zu ermöglichen, ist das was uns antreibt. Mit unserer individuellen Betreuung entwickeln wir ganzheitliche Strategien, die zu unseren Mandanten passen. Dabei legen wir vor allem Wert auf den kontinuierlichen, persönlichen Austausch. 
Indem wir eng mit unseren Mandanten zusammenarbeiten, finden wir heraus, was sie wirklich bewegt. Dabei haben wir eine zentrale Sache herausgefunden: 
Wir haben einen angestellten Maschinenbauingenieur, einen Apotheker und einen Konzerninhaber gefragt, was Ihnen in der Zusammenarbeit mit uns wichtig ist und welche Strategie wir gemeinsam verfolgen wollen. Alle gaben uns intuitiv dieselbe Antwort.
„Zeit - wir wollen mehr Zeit haben.“
Danach haben wir mit unserem Expertenteam die einzigartige hourglass investment strategy entwickelt, die uns und unseren Mandanten noch besser und effektiver dabei hilft, ihre Motive und Bedürfnisse zu verstehen.                        
                      ''',
                      textAlign: TextAlign.center,
                      style: R.styles.lSNormalStyle,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 955,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlexibleConstrainedBox(
                          maxWidth: 240,
                          child: Assets.images.rowImage1.image(
                            height: 260,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        FlexibleConstrainedBox(
                          maxWidth: 240,
                          child: Assets.images.rowImage2.image(
                            height: 260,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        FlexibleConstrainedBox(
                          maxWidth: 240,
                          child: Assets.images.rowImage3.image(
                            height: 260,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 582,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 100),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Assets.images.homeImage2.image().image,
                fit: BoxFit.cover,
                scale: 1.3,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 847),
                  child: Text(
                    'Das Leben von morgen schon heute gestalten.',
                    style: R.styles.lSMainStyle1.copyWith(fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 29),
                Padding(
                  padding: const EdgeInsets.only(right: 65),
                  child: Text(
                    '- mit SYKZ',
                    style: TextStyle(
                      fontWeight: R.fontWidths.regular,
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 63, bottom: 154),
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Text(
                    'Über uns',
                    textAlign: TextAlign.center,
                    style: R.styles.lSPageTitleStyle.copyWith(
                      color: const Color(0XFFB0D9C0),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 922),
                    child: Text(
                      '''
Wir helfen Angestellten, Selbstständigen und Unternehmern dabei, mit Investment- und Steuerstrategien mehr Geld zu sparen, dieses intelligent zu reinvestieren und so frühzeitig nachhaltigen Wohlstand aufzubauen - so können unsere Mandanten ihren gewünschten Ruhestand mit unserer Hilfe steuern. 
Außerdem beraten wir unsere Mandanten fortlaufend in strategischen Zielsetzungen, bei der Optimierung interner Prozesse und dem Schaffen neuer Werte.

Wir legen viel Wert auf die Auswahl unserer Kooperationspartner. Dabei achten wir insbesondere auf Integrität, kurze Kommunikationsstrecken, professionelle und effiziente Arbeitsprozesse und ein vertrauensvolles Verhältnis.
Auch das Thema Data Safety wird bei uns groß geschrieben: Wir gehen beim Umgang mit sensiblen Daten mit höchstem Verantwortungsbewusstsein vor.
Jetzt Strategie Termin vereinbaren.
                      ''',
                      textAlign: TextAlign.center,
                      style: R.styles.lSNormalStyle,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 1114,
                    ),
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlexibleConstrainedBox(
                              maxWidth: 358,
                              child: CustomCard(
                                topPadding: 160,
                                background: Assets.images.staggeredRowImage1.image(
                                  height: 500,
                                  fit: BoxFit.cover,
                                ),
                                title: 'Unternehmensberatung',
                                buttonText: 'Jetzt mehr erfahren',
                              ),
                            ),
                            const SizedBox(width: 20),
                            FlexibleConstrainedBox(
                              maxWidth: 358,
                              child: CustomCard(
                                topPadding: 80,
                                background: Assets.images.staggeredRowImage2.image(
                                  height: 500,
                                  fit: BoxFit.cover,
                                ),
                                title: 'Rückabwicklung',
                                buttonText: 'Jetzt mehr erfahren',
                              ),
                            ),
                            const SizedBox(width: 20),
                            FlexibleConstrainedBox(
                              maxWidth: 358,
                              child: CustomCard(
                                topPadding: 0,
                                background: Assets.images.staggeredRowImage1.image(
                                  height: 500,
                                  fit: BoxFit.cover,
                                ),
                                title: 'Investment & Vermögensschutz',
                                buttonText: 'Jetzt mehr erfahren',
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Text(
                            'Kompetenzen',
                            style: R.styles.lSPageTitleStyle.copyWith(
                              color: const Color(0XFFE6D1E5),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 60, right: 60),
            color: const Color(0XFF1A1A1A),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  flex: 4,
                  child: Assets.images.rotatedImage.svg(width: 333),
                ),
                const SizedBox(width: 20),
                DefaultTextStyle(
                  style: R.styles.lSPageTitleStyle.copyWith(
                    color: const Color(0XFFFCDFCF),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 84),
                    child: SizedBox(
                      width: 250,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text('SYKZ'),
                          Text('hourglass'),
                          Text('strategy'),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 38),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 38),
                    child: Text(
                      '''
Mit der SYKZ hourglass strategy verfolgen wir eine ganzheitlich neue Herangehensweise in der Finanzberatung. Uns ist aufgefallen, dass bei der Analyse unserer Mandanten ein Thema immer wieder in den Fokus rückt. Bei der Frage, was unseren Mandanten in der Beratung am wichtigsten ist, kommt fast immer die selbe Antwort: Zeit. Deswegen haben wir es uns zur Aufgabe gemacht, diese knappe und unwiederbringliche Ressource zu unserem Hauptaugenmerk in der Betreuung unserer Mandanten zu machen:
Mehr Zeit für Familie. Mehr Zeit für die eine Reise, die schon seit Jahren passieren sollte. Mehr Zeit, um das Leben sorgenfrei auszuschöpfen.
                      ''',
                      textAlign: TextAlign.start,
                      style: R.styles.lSNormalStyle.copyWith(
                        color: const Color(0XFFB8B8B8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 105, horizontal: 163),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1114,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Partner',
                    style: R.styles.lSPageTitleStyle.copyWith(color: Colors.black),
                  ),
                  Text(
                    '''
VERTRAUEN. Wir beleuchten alle Kooperationspartner immer auf zweierlei Art. 
Unser Team, das sich durch jahrelange Erfahrung auszeichnet, sorgt durch strategische Unternehmensanalysen nicht nur für maximale Sicherheit und Transparenz in der Auswahl unserer Partner - uns ist es ebenso wichtig, eine Unternehmenskultur auf Augenhöhe zu leben. Daher kennen wir die Inhaber unserer Partnerunternehmen stets persönlich.
                  ''',
                    style: R.styles.lSNormalStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlexibleConstrainedBox(
                          maxWidth: 358,
                          child: Container(
                            height: 120,
                            color: const Color(0XFFC4C4C4),
                          )),
                      const SizedBox(width: 20),
                      FlexibleConstrainedBox(
                          maxWidth: 358,
                          child: Container(
                            height: 120,
                            color: const Color(0XFFC4C4C4),
                          )),
                      const SizedBox(width: 20),
                      FlexibleConstrainedBox(
                        maxWidth: 358,
                        child: Container(
                          height: 120,
                          color: const Color(0XFFC4C4C4),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 163,
              right: 163,
              top: 30,
              bottom: 58,
            ),
            decoration: BoxDecoration(
              color: Color.alphaBlend(
                R.colors.maskColor2.withOpacity(0.5),
                Colors.white,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Referenzen',
                  style: R.styles.lSPageTitleStyle.copyWith(color: const Color(0xFF9189A7)),
                ),
                const SizedBox(
                  height: 74,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 1114,
                  ),
                  child: const PhotoCollageWidget(),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 155,
              right: 155,
              top: 59,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1114,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Vision',
                              style: R.styles.lSPageTitleStyle.copyWith(
                                color: const Color(0xFFC5BBDE),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '''
Perspektive. Unser Anspruch an uns selbst und an unsere Dienstleistungen sollte schon immer in der Ganzheitlichkeit liegen.
Um die Bedürfnisse der Mandanten zu ermitteln, gehört für uns daher ein umfangreiches Kennenlernen dazu. Wir möchten nicht nur der Partner für Ihre Finanzen und Ihre Unternehmensberatung sein - wir möchten jeden Mandanten auf persönlicher Ebene verstehen lernen, um so seine Individualität zu würdigen. Dies schätzen unsere Mandanten sehr.
Unser Fokus liegt auf Exklusivität. 
Bei  SYKZ arbeiten wir mit Menschen zusammen, nicht mit Zahlen. Daher schauen auch wir bei jedem Erstgespräch, ob Sie zu uns passen.
                            ''',
                              style: R.styles.lSNormalStyle,
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 100),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mission',
                              style: R.styles.lSPageTitleStyle.copyWith(
                                color: const Color(0xFFB2D9C0),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '''
Innovation.Hochkomplexe Themen in Nischenmärkten jedem zugänglich zu machen, der es wertschätzen kann - das ist unsere Passion. Wir machen keine klassische Finanz- und Unternehmensberatung. Wir schaffen wirkliche Werte. 
Wie wir das tun? Weil wir hinter die Fassade schauen. Indem wir die richtigen Fragen stellen, finden wir für Sie die richtigen Antworten.
                              ''',
                              style: R.styles.lSNormalStyle,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),
                  Text(
                    'Team',
                    style: R.styles.lSPageTitleStyle.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlexibleConstrainedBox(
                        maxWidth: 358,
                        child: TeamMemberCard(
                          memberPhoto: Assets.images.member1.image(
                            height: 500,
                            fit: BoxFit.cover,
                          ),
                          info: 'Lorem ipsum dolor sit amet, '
                              'consectetur adipiscing elit. '
                              'Vulputate varius dolor, ac cras ultricies '
                              'viverra etiam augue viverra. '
                              'Consectetur ornare curabitur leo a '
                              'lacus turpis id sit vestibulum.',
                        ),
                      ),
                      const SizedBox(width: 20),
                      FlexibleConstrainedBox(
                        maxWidth: 358,
                        child: TeamMemberCard(
                          memberPhoto: Assets.images.member2.image(
                            height: 500,
                            fit: BoxFit.cover,
                          ),
                          info: 'Lorem ipsum dolor sit amet, '
                              'consectetur adipiscing elit. '
                              'Vulputate varius dolor, ac cras ultricies '
                              'viverra etiam augue viverra. '
                              'Consectetur ornare curabitur leo a '
                              'lacus turpis id sit vestibulum.',
                        ),
                      ),
                      const SizedBox(width: 20),
                      FlexibleConstrainedBox(
                        maxWidth: 358,
                        child: TeamMemberCard(
                          memberPhoto: Assets.images.member3.image(
                            height: 500,
                            fit: BoxFit.cover,
                          ),
                          info: 'Lorem ipsum dolor sit amet, '
                              'consectetur adipiscing elit. '
                              'Vulputate varius dolor, ac cras ultricies '
                              'viverra etiam augue viverra. '
                              'Consectetur ornare curabitur leo a '
                              'lacus turpis id sit vestibulum.',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 116),
                  Text(
                    'Dein Weg mit',
                    style: R.styles.lSPageTitleStyle.copyWith(
                      color: Colors.black,
                      fontWeight: R.fontWidths.regular,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Assets.icons.sykzIcon2.svg(
                    height: 68.74,
                    width: 210,
                  ),
                  const SizedBox(height: 60),
                  const AppForm1(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

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
            CheckboxListTile(
              value: false,
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              onChanged: (value) {},
              title: Text(
                'Ich stimme den AGBs zu.',
                style: R.styles.lSNormalStyle.copyWith(
                  color: const Color(0XFF6F6F6F),
                  fontSize: 14,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: DestinationButtonWidget(
                text: 'Absenden',
                onTap: () {},
                horizontalPadding: 19,
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

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.darkMode = false,
    required this.hintText,
  })  : options = const [],
        isDropdown = false;

  const CustomTextField.dropdown({
    super.key,
    this.darkMode = false,
    required this.options,
  })  : hintText = '',
        isDropdown = true;

  final String hintText;
  final bool darkMode;
  final List<String> options;
  final bool isDropdown;

  @override
  Widget build(BuildContext context) {
    final decoration = InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      enabledBorder: const UnderlineInputBorder(),
      hintStyle: R.styles.lSMainStyle2.copyWith(
        shadows: [],
        color: const Color(0XFF6F6F6F),
      ),
    );

    return isDropdown
        ? DropdownButtonFormField<String>(
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down),
            decoration: decoration,
            value: options.isNotEmpty ? options.first : null,
            items: options
                .map(
                  (opt) => DropdownMenuItem<String>(
                    value: opt,
                    child: Text(
                      opt,
                      style: R.styles.lSMainStyle2.copyWith(
                        shadows: [],
                        color: const Color(0XFF6F6F6F),
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {},
          )
        : TextFormField(
            style: R.styles.lSMainStyle2.copyWith(
              shadows: [],
              color: Colors.black,
            ),
            decoration: decoration.copyWith(
              hintText: hintText,
            ),
          );
  }
}

class PhotoCollageWidget extends StatelessWidget {
  const PhotoCollageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const dividerSize = 20.0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 280,
          child: Assets.images.collage1.image(
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: dividerSize),
        SizedBox(
          height: 280,
          child: Row(
            children: [
              Expanded(
                child: Assets.images.collage2.image(
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: dividerSize),
              Expanded(
                child: Assets.images.collage3.image(
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: dividerSize),
        SizedBox(
          height: 560,
          child: Row(
            children: [
              Expanded(
                child: Assets.images.collage4.image(
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: dividerSize),
              Expanded(
                child: Assets.images.collage5.image(
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FlexibleConstrainedBox extends StatelessWidget {
  const FlexibleConstrainedBox({
    super.key,
    required this.maxWidth,
    required this.child,
    this.flex = 1,
  });

  final int flex;
  final double maxWidth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
        ),
        child: child,
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.background,
    required this.title,
    required this.buttonText,
    required this.topPadding,
  });

  final Widget background;
  final String title;
  final String buttonText;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: topPadding,
            ),
            Stack(
              children: [
                background,
                Positioned(
                  left: 18,
                  top: 21,
                  right: 18,
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: constraint.maxWidth,
                    child: Text(
                      title,
                      style: R.styles.lSHomeCardTitleStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  bottom: 22,
                  right: 15,
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: constraint.maxWidth,
                    child: DestinationButtonWidget(
                      backgroundColor: const Color(0XFFB4B4B4).withOpacity(0.8),
                      textColor: const Color(0XFFF5F2F0),
                      horizontalPadding: 11,
                      text: buttonText,
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class TeamMemberCard extends StatelessWidget {
  const TeamMemberCard({
    super.key,
    required this.memberPhoto,
    required this.info,
  });

  final Widget memberPhoto;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        memberPhoto,
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: Container(
            alignment: Alignment.topLeft,
            color: Colors.black.withOpacity(0.5),
            padding: const EdgeInsets.symmetric(
              horizontal: 31,
              vertical: 25,
            ),
            child: Text(
              info,
              textAlign: TextAlign.center,
              style: R.styles.lSNormalStyle.copyWith(
                color: Colors.white,
                height: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HomeFirstSectionContent extends StatelessWidget {
  const HomeFirstSectionContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 139,
        child: PlayAnimationBuilder<double>(
          curve: Curves.decelerate,
          tween: Tween(begin: 0, end: 1), // 100.0 to 200.0
          duration: const Duration(milliseconds: 800),
          builder: (context, value, _) {
            const translationFactor = 150;
            final translationValue = translationFactor - (value * translationFactor);

            return Opacity(
              opacity: value,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.translate(
                    offset: Offset(-translationValue, 0),
                    child: Assets.icons.sykzIcon.svg(
                      height: 68.74,
                      width: 210,
                    ),
                  ),
                  VerticalDivider(
                    color: R.colors.iconsColor,
                    width: 46,
                  ),
                  Transform.translate(
                    offset: Offset(translationValue, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DestinationButtonWidget(
                          horizontalMargin: 0,
                          horizontalPadding: 12,
                          selected: false,
                          onTap: () {},
                          text: 'Strategie Termin',
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        const SocialMediaList(),
                        const SizedBox(
                          height: 14,
                        ),
                        Text(
                          'DESIRE. CREATE. INSPIRE.',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: R.colors.sloganColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
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
