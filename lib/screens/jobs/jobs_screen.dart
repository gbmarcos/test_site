
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_site/app/navigation/beamer_router.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/common/widgets/common_widgets.dart';
import 'package:test_site/common/widgets/custom_scrollable_positioned_list.dart';
import 'package:test_site/gen/assets.gen.dart';
import 'package:test_site/r.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  final sectionStepsNotifier = ValueNotifier(_SectionSteps.jobsList);

  late final sections = [
    LayoutBuilder(builder: (context, _) {
      return SizedBox(
        height: context.mediaQuery.size.height,
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
              NavigationWidget(
                onSelected: (page) {
                  onNavigationActionSelect(
                    page: page,
                    context: context,
                  );
                },
              ),
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
      );
    }),
    MultiProvider(
      providers: [
        Provider<VoidCallback>(
          create: (_) => () => itemScrollController.scrollTo(
                index: 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOutCubic,
              ),
        ),
        ChangeNotifierProvider.value(value: sectionStepsNotifier)
      ],
      child: const ContentView(),
    ),
    const _SectionContent3(),
    const CustomFooter(),
  ];

  late final ItemScrollController itemScrollController = ItemScrollController();
  late final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  @override
  Widget build(BuildContext context) => CustomScrollablePositionedList(
    itemScrollController: itemScrollController,
    itemPositionsListener: itemPositionsListener,
    sections: sections,
  );
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

enum _SectionSteps {
  jobsList(widget: _JobsListWidget()),
  description(widget: _JobDescriptionWidget()),
  applyNow(widget: _ApplyNowWidget());

  const _SectionSteps({required this.widget});

  final Widget widget;
}

class ContentView extends StatefulWidget {
  const ContentView({Key? key}) : super(key: key);

  @override
  State<ContentView> createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
        return Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            ...previousChildren,
            if (currentChild != null) currentChild,
          ],
        );
      },
      duration: const Duration(milliseconds: 300),
      child: Provider.of<ValueNotifier<_SectionSteps>>(
        context,
      ).value.widget,
    );
  }
}

class _JobDescriptionWidget extends StatelessWidget {
  const _JobDescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stepNotifier = Provider.of<ValueNotifier<_SectionSteps>>(context, listen: false);

    final style1 = TextStyle(
      fontSize: 14,
      fontWeight: R.fontWidths.bold,
      color: Colors.black,
    );

    final style2 = TextStyle(
      fontSize: 11,
      fontWeight: R.fontWidths.medium,
      color: Colors.black,
      height: 2.4,
    );

    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        top: Responsive.isDesktop(context) ? 47 : 30,
        bottom: 100,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: Responsive.isDesktop(context)
                  ? 180
                  : Responsive.isTablet(context)
                      ? 87
                      : 30,
            ),
            child: Text(
              'Jobs: 6 | Standorte: 2 | Kategorien: 1',
              style: context.normalStyle.copyWith(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.isDesktop(context)
                  ? 205
                  : Responsive.isTablet(context)
                      ? 80
                      : 30,
            ),
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
                    style: context.normalStyle.copyWith(
                      height: 1,
                    ),
                    onTap: () {
                      stepNotifier.value = _SectionSteps.jobsList;
                      context.read<VoidCallback>()();
                    },
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Baubegleiter / Projektsupport FTTX (m/w/d)',
                          style: style1.copyWith(
                            fontSize: Responsive.isDesktop(context)
                                ? 18
                                : Responsive.isTablet(context)
                                    ? 14
                                    : 12,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Festanstellung, Vollzeit · Bremen',
                          style: style2,
                        ),
                        const SizedBox(height: 23),
                        Text(
                          'DEINE BENEFITS',
                          style: style1,
                        ),
                        const SizedBox(height: 14),
                        Text(
                          '''
 - Krisensicher in die Zukunft: Glasfasernetze gelten als Infrastruktur der Zukunft. Profitiere von dem Einstieg in eine der perspektivreichsten Branchen in einem mittelständischen Arbeitsumfeld
 - Wir investieren in Dich: Du kannst auf ein vielfältiges Weiterbildungsangebot zugreifen
 - Gewinne Sicherheit im Job: Du erhältst einen unbefristeten Arbeitsvertrag in einem systemrelevanten Unternehmen
 - Dein Start bei uns: Freu Dich auf eine sorgfältige und umfangreiche Einarbeitung in unserer Zentrale in Bochum
 - Wir geben Dir Freiraum: Flexible Arbeitszeitregelungen und mobiles Arbeiten ermöglichen es Dir, Privates und Berufliches miteinander zu verbinden 
 - Sei Teil unserer Gemeinschaft: Dich erwartet ein vertrauensvolles Miteinander in einer dynamischen und innovativen Atmosphäre sowie tolle Firmenevents
 - Plane mit uns Deine Zukunft: Du erhältst eine leistungsgerechte Vergütung sowie eine betriebliche Altersvorsorge für Deine Zukunftsplanung
                          ''',
                          style: style2,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'DEIN AUFGABENBEREICH',
                          style: style1,
                        ),
                        const SizedBox(height: 14),
                        Text(
                          '''
 - Du überwachst die Baumaßnahmen zum Ausbau von Glasfasernetzen
 - Du kommunizierst mit den Baubeteiligten, Kunden und Fachbereichen
 - Du erfasst, dokumentierst und pflegst die Bauleistungen in unserer Software
 - Du erstellst Feldaufmaße und Bilddokumetationen von Tiefbaumaßnahmen
 - Du bist für die Vermessung und Dokumentation der Baumaßnahme in CAD/GIS Systemen zuständig
 - Du führst Qualitätskontrollen durch und dokumentierst diese
 - Du organisierst die kaufmännische Sachbearbeitung selbstständig
                          ''',
                          style: style2,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'DEINE KOMPETENZEN',
                          style: style1,
                        ),
                        const SizedBox(height: 14),
                        Text(
                          '''
 - Du verfügst über eine erfolgreich abgeschlossene Ausbildung als technischer Zeichner, Vermesser (m/w/d) oder vergleichbare Qualifikation
 - Du besitzt Erfahrung im Baugewerbe und Kenntnisse mit CAD und/oder GIS-Systemen
 - Du bist sicher in der Anwendung von MS Office
 - Du arbeitest selbstständig und kundenorientiert
 - Du bist teamfähig, besitzt eine hohe Lernbereitschaft sowie engagierte Arbeitsweise und bist belastbar
 - Du besitzt einen Führerschein Klasse B
                          ''',
                          style: style2,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'KONTAKT',
                          style: style1,
                        ),
                        const SizedBox(height: 14),
                        Text(
                          'Wenn Du Teil unseres Teams werden möchtest, '
                          'dann freuen wir uns auf Deine Bewerbung. '
                          'Bewirb Dich jetzt bei uns über unser Online-Formular'
                          ' oder per E-Mail an jobs@fe-construction.de.',
                          style: style2,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'ÜBER UNS',
                          style: style1,
                        ),
                        const SizedBox(height: 14),
                        Text(
                          '''
Wir, die FE CONSTRUCTION, sind als Generalunternehmer spezialisiert auf den Breitbandausbau, die Erstellung und den Betrieb für FTTH-Glasfaser-Infrastrukturen. Wir arbeiten bundesweit und haben unsere Wurzeln in Bochum in Nordrhein-Westfalen. Um unser ambitioniertes Wachstum voranzutreiben, sind wir seit 2021 eines der Portfolio Unternehmen der vitronet Gruppe.

Unsere Kunden sind private und öffentliche Auftraggeber. Dazu zählen Stadtwerke und Kommunen, die Wohnungswirtschaft, Netzbetreiber und Versorgungsunternehmen. Wir arbeiten kooperativ und auf Augenhöhe mit ihnen zusammen – und führen unsere Projekte gemeinsam nachhaltig zum Erfolg.
                          ''',
                          style: style2,
                        ),
                        const SizedBox(height: 60),
                        DestinationButtonWidget(
                          text: 'Jetzt bewerben',
                          onTap: () {
                            stepNotifier.value = _SectionSteps.applyNow;
                            context.read<VoidCallback>()();
                          },
                          horizontalPadding: 25,
                          textColor: Colors.black,
                          horizontalMargin: 0,
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

class _ApplyNowWidget extends StatelessWidget {
  const _ApplyNowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stepNotifier = Provider.of<ValueNotifier<_SectionSteps>>(context, listen: false);

    final style1 = TextStyle(
      fontSize: 14,
      fontWeight: R.fontWidths.bold,
      color: Colors.black,
    );

    final style2 = TextStyle(
      fontSize: 11,
      fontWeight: R.fontWidths.medium,
      color: Colors.black,
      height: 2.4,
    );

    final style3 = TextStyle(
      fontSize: Responsive.isDesktop(context) ? 16 : 11,
      fontWeight: R.fontWidths.regular,
      color: Colors.black,
    );

    final style4 = TextStyle(
      fontSize: Responsive.isDesktop(context) ? 24 : 14,
      fontWeight: R.fontWidths.bold,
      color: const Color(0xFF150A01),
    );

    const separator = SizedBox(height: 20);
    const box1 = _CustomCard(
      title: 'LEBENSLAUF *',
      content: 'Per Klick mehrere Dateien auswählen '
          'oder Drag-and-drop verwenden',
    );
    const box2 = _CustomCard(
      title: 'ANSCHREIBEN',
      content: 'Per Klick mehrere Dateien auswählen '
          'oder Drag-and-drop verwenden',
    );
    const box3 = _CustomCard(
      title: 'ARBEITSZEUGNIS',
      content: 'Per Klick mehrere Dateien auswählen '
          'oder Drag-and-drop verwenden',
    );
    const box4 = _CustomCard(
      title: 'ANDERE',
      content: 'Per Klick mehrere Dateien auswählen '
          'oder Drag-and-drop verwenden',
    );
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        top: Responsive.isDesktop(context) ? 47 : 30,
        bottom: 100,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: Responsive.isDesktop(context)
                  ? 180
                  : Responsive.isTablet(context)
                      ? 87
                      : 30,
            ),
            child: Text(
              'Jobs: 6 | Standorte: 2 | Kategorien: 1',
              style: context.normalStyle.copyWith(
                color: Colors.black,
              ),
            ),
          ),
          separator,
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.isDesktop(context)
                  ? 205
                  : Responsive.isTablet(context)
                      ? 80
                      : 30,
            ),
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
                    style: context.normalStyle.copyWith(
                      height: 1,
                    ),
                    onTap: () {
                      stepNotifier.value = _SectionSteps.description;
                      context.read<VoidCallback>()();
                    },
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Baubegleiter / Projektsupport FTTX (m/w/d)',
                          style: style1.copyWith(
                            fontSize: Responsive.isDesktop(context)
                                ? 18
                                : Responsive.isTablet(context)
                                    ? 14
                                    : 12,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Festanstellung, Vollzeit · Bremen',
                          style: style2,
                        ),
                        const SizedBox(height: 45),
                        Text(
                          'DEINE BEWERBUNG',
                          style: style4,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Wir freuen uns über Dein Interesse an der STG '
                          'Gruppe als Arbeitgeber. Bitte fülle das folgende '
                          'kurze Formular aus. Solltest Du Schwierigkeiten '
                          'mit dem Upload Deiner Daten haben, wende dich gerne '
                          'per Email an .',
                          style: style3,
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
                          style: style4,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Bitte lade hier die für die Stelle benötigten'
                          ' Bewerbungsunterlagen hoch (z.B. Lebenslauf, '
                          'Anschreiben, Zeugnisse, Gehaltsvorstellung etc.).',
                          style: style3,
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
                                if (!Responsive.isMobile(context)) ...[
                                  Row(
                                    children: const [
                                      Expanded(
                                        child: box1,
                                      ),
                                      SizedBox(width: 30),
                                      Expanded(
                                        child: box2,
                                      ),
                                    ],
                                  ),
                                  separator,
                                  Row(
                                    children: const [
                                      Expanded(
                                        child: box3,
                                      ),
                                      SizedBox(width: 30),
                                      Expanded(
                                        child: box4,
                                      ),
                                    ],
                                  ),
                                ] else ...[
                                  box1,
                                  separator,
                                  box2,
                                  separator,
                                  box3,
                                  separator,
                                  box4,
                                  separator,
                                ],
                                CustomCheckButton(
                                  text:
                                      'Hiermit bestätige ich, dass ich die Datenschutzerklärung zur',
                                  textStyle: style3.copyWith(fontSize: 11),
                                  iconColor: R.colors.roundedHeaderColor,
                                ),
                                const SizedBox(height: 33),
                                Flex(
                                  direction: Responsive.isMobile(context)
                                      ? Axis.vertical
                                      : Axis.horizontal,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    DestinationButtonWidget(
                                      expanded: Responsive.isMobile(context),
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
                                    const SizedBox(height: 22),
                                    DestinationButtonWidget(
                                      expanded: Responsive.isMobile(context),
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

class _JobsListWidget extends StatelessWidget {
  const _JobsListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stepNotifier = Provider.of<ValueNotifier<_SectionSteps>>(context, listen: false);

    final style1 = TextStyle(
      fontSize: Responsive.isMobile(context) ? 18 : 20,
      fontWeight: R.fontWidths.bold,
      color: const Color(0xFF6996BA),
    );

    final style2 = TextStyle(
      fontSize: Responsive.isMobile(context)
          ? 12
          : Responsive.isTablet(context)
              ? 16
              : 20,
      fontWeight: R.fontWidths.semiBold,
      color: Colors.black,
    );

    final style3 = TextStyle(
      fontSize: Responsive.isDesktop(context) ? 12 : 11,
      fontWeight: R.fontWidths.medium,
      color: Colors.black,
    );

    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        top: Responsive.isDesktop(context) ? 47 : 30,
        bottom: 100,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: Responsive.isDesktop(context)
                  ? 180
                  : Responsive.isTablet(context)
                      ? 87
                      : 30,
            ),
            child: Text(
              'Jobs: 6 | Standorte: 2 | Kategorien: 1',
              style: context.normalStyle.copyWith(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.isDesktop(context)
                  ? 205
                  : Responsive.isTablet(context)
                      ? 80
                      : 30,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1114,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RoundedHeader.search(
                    text: 'Stellen durchsuchen',
                    style: context.normalStyle.copyWith(
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bremen',
                          style: style1,
                        ),
                        const SizedBox(height: 40),
                        CustomListTile(
                          style2: style2,
                          style3: style3,
                          titleList: const ['Baubegleiter / Projektsupport FTTX (m/w/d)'],
                          subtitle: 'Festanstellung, Vollzeit  ·  Bremen',
                          onTap: () {
                            stepNotifier.value = _SectionSteps.description;
                            context.read<VoidCallback>()();
                          },
                        ),
                        const SizedBox(height: 30),
                        CustomListTile(
                          style2: style2,
                          style3: style3,
                          titleList: const [
                            'Bauleiter (m/w/d) für die Bereiche Kabelanlagen, Rohrleitungsbau, ',
                            'Kommunikationsnetze und Hausanschlüsse',
                          ],
                          subtitle: 'Festanstellung, Vollzeit  ·  Bremen',
                          onTap: () {
                            stepNotifier.value = _SectionSteps.description;
                            context.read<VoidCallback>()();
                          },
                        ),
                        const SizedBox(height: 30),
                        CustomListTile(
                          style2: style2,
                          style3: style3,
                          titleList: const ['Mitarbeiter (m/w/d) im Bereich Lager/Logistik'],
                          subtitle: 'Festanstellung, Vollzeit  ·  Bremen',
                          onTap: () {
                            stepNotifier.value = _SectionSteps.description;
                            context.read<VoidCallback>()();
                          },
                        ),
                        const SizedBox(height: 30),
                        CustomListTile(
                          style2: style2,
                          style3: style3,
                          titleList: const [
                            'Personalreferent (m/w/d) in Teilzeit (20-30 Std./Woche)'
                          ],
                          subtitle: 'Festanstellung, Vollzeit  ·  Bremen',
                          onTap: () {
                            stepNotifier.value = _SectionSteps.description;
                            context.read<VoidCallback>()();
                          },
                        ),
                        const SizedBox(height: 30),
                        CustomListTile(
                          style2: style2,
                          style3: style3,
                          titleList: const ['Schlosser / Schweißer (m/w/d) für unsere Werkstatt'],
                          subtitle: 'Festanstellung, Vollzeit  ·  Bremen',
                          onTap: () {
                            stepNotifier.value = _SectionSteps.description;
                            context.read<VoidCallback>()();
                          },
                        ),
                        const SizedBox(height: 60),
                        Text(
                          'Hamburg',
                          style: style1,
                        ),
                        const SizedBox(height: 40),
                        CustomListTile(
                          style2: style2,
                          style3: style3,
                          titleList: const [
                            'Kfm. Angestellter Baubüro (m/w/d) in Voll- oder Teilzeit'
                          ],
                          subtitle: 'Festanstellung, Voll- oder Teilzeit  ·  Hamburg',
                          onTap: () {
                            stepNotifier.value = _SectionSteps.description;
                            context.read<VoidCallback>()();
                          },
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

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.style2,
    required this.style3,
    required this.titleList,
    required this.subtitle,
    this.onTap,
  });

  final VoidCallback? onTap;
  final TextStyle style2;
  final TextStyle style3;
  final List<String> titleList;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...titleList
                    .map(
                      (title) => Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: style2,
                          ),
                          const SizedBox(height: 7),
                        ],
                      ),
                    )
                    .toList(),
                Text(
                  'Festanstellung, Vollzeit  ·  Bremen',
                  style: style3,
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios_outlined)
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
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isDesktop(context) ? 155 : 60,
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
