import 'package:flutter/material.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/common/widgets/common_widgets.dart';
import 'package:test_site/gen/assets.gen.dart';
import 'package:test_site/r.dart';

class KarriereScreen extends StatelessWidget {
  const KarriereScreen({Key? key}) : super(key: key);

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
                  image: Assets.images.newsTeamKarriereImage1.image().image,
                  fit: BoxFit.cover,
                  scale: 1.3,
                ),
              ),
              child: Column(
                children: [
                  const NavigationWidget(),
                  if (Responsive.isMobile(context))
                    const Expanded(
                      child: SizedBox.shrink(),
                    ),
                  const Expanded(
                    child: _SectionContent1(),
                  ),
                ],
              ),
            ),
          ),
          const _SectionContent2(),
          const _SectionContent3(),
          const CustomFooter(),
        ],
      ),
    );
  }
}

class _SectionContent1 extends StatelessWidget {
  const _SectionContent1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Offene Stellenangebote',
              style: context.mainStyle1,
              textAlign: context.mainPageTextAlign,
            ),
            Text(
              'Du hast Lust, Teil unseres Teams zu werden? Dann bewirb dich jetzt bei uns!',
              style: context.mainStyle2,
              textAlign: context.mainPageTextAlign,
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionContent2 extends StatelessWidget {
  const _SectionContent2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style1 = TextStyle(
      fontSize: 16,
      fontWeight: R.fontWidths.regular,
      color: Colors.black,
    );

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(
        top: 47,
        bottom: 98,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 180),
            child: Text(
              'Jobs: 6 | Standorte: 2 | Kategorien: 1',
              style: R.styles.lSNormalStyle.copyWith(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 205),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1114,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RoundedHeader.backButton(
                    text: 'Stellen durchsuchen',
                    style: R.styles.lSNormalStyle.copyWith(fontSize: 16, height: 1),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Baubegleiter / Projektsupport FTTX (m/w/d)',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: R.fontWidths.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          'Festanstellung, Vollzeit · Bremen',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: R.fontWidths.medium,
                            color: Colors.black,
                            height: 2.4,
                          ),
                        ),
                        const SizedBox(height: 45),
                        Text(
                          'DEINE BEWERBUNG',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: R.fontWidths.bold,
                            color: const Color(0xFF150A01),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Wir freuen uns über Dein Interesse an der STG '
                          'Gruppe als Arbeitgeber. Bitte fülle das folgende '
                          'kurze Formular aus. Solltest Du Schwierigkeiten '
                          'mit dem Upload Deiner Daten haben, wende dich gerne '
                          'per Email an .',
                          style: style1,
                        ),
                        const SizedBox(height: 40),
                        Align(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 430,
                            ),
                            child: const AppForm3(),
                          ),
                        ),
                        const SizedBox(height: 60),
                        Text(
                          'DOKUMENTE',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: R.fontWidths.bold,
                            color: const Color(0xFF150A01),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Bitte lade hier die für die Stelle benötigten'
                          ' Bewerbungsunterlagen hoch (z.B. Lebenslauf, '
                          'Anschreiben, Zeugnisse, Gehaltsvorstellung etc.).',
                          style: style1,
                        ),
                        const SizedBox(height: 40),
                        Align(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 430,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Expanded(
                                      child: _CustomCard(
                                        title: 'LEBENSLAUF *',
                                        content: 'Per Klick mehrere Dateien auswählen '
                                            'oder Drag-and-drop verwenden',
                                      ),
                                    ),
                                    SizedBox(width: 30),
                                    Expanded(
                                      child: _CustomCard(
                                        title: 'ANSCHREIBEN',
                                        content: 'Per Klick mehrere Dateien auswählen '
                                            'oder Drag-and-drop verwenden',
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: const [
                                    Expanded(
                                      child: _CustomCard(
                                        title: 'ARBEITSZEUGNIS',
                                        content: 'Per Klick mehrere Dateien auswählen '
                                            'oder Drag-and-drop verwenden',
                                      ),
                                    ),
                                    SizedBox(width: 30),
                                    Expanded(
                                      child: _CustomCard(
                                        title: 'ANDERE',
                                        content: 'Per Klick mehrere Dateien auswählen '
                                            'oder Drag-and-drop verwenden',
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                CustomCheckButton(
                                  text:
                                      'Hiermit bestätige ich, dass ich die Datenschutzerklärung zur',
                                  textStyle: style1.copyWith(fontSize: 11),
                                  iconColor: R.colors.roundedHeaderColor,
                                ),
                                const SizedBox(height: 33),
                                Row(
                                  children: [
                                    DestinationButtonWidget(
                                      text: 'BEWERBUNG ABSCHICKEN',
                                      backgroundColor: const Color(0xFFCAE4F8).withOpacity(0.5),
                                      textColor: Colors.black,
                                      fontWeight: R.fontWidths.medium,
                                      fontSize: 12,
                                      horizontalPadding: 20,
                                      horizontalMargin: 0,
                                      elevation: 0,
                                      opacity: 1,
                                      onTap: () {},
                                    ),
                                    const SizedBox(width: 33),
                                    DestinationButtonWidget(
                                      text: 'ABBRUCH',
                                      onTap: () {},
                                      fontWeight: R.fontWidths.medium,
                                      fontSize: 12,
                                      horizontalPadding: 20,
                                      textColor: Colors.black,
                                      backgroundColor: const Color(0xFFCAE4F8),
                                      horizontalMargin: 0,
                                      elevation: 0,
                                      opacity: 1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionContent3 extends StatelessWidget {
  const _SectionContent3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(
        left: 155,
        right: 155,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1114,
        ),
        child: const AppForm1(),
      ),
    );
  }
}

class _CustomCard extends StatelessWidget {
  const _CustomCard({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    final style1 = TextStyle(
      fontWeight: R.fontWidths.semiBold,
      fontSize: 11,
      color: Colors.black,
    );

    final style2 = TextStyle(
      fontWeight: R.fontWidths.medium,
      fontSize: 10,
      color: Colors.black,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: style1,
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.all(20),
          color: const Color(0xFFCAE4F8).withOpacity(0.5),
          child: Text(
            content,
            style: style2,
          ),
        )
      ],
    );
  }
}
