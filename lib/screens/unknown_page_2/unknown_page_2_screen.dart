import 'package:flutter/material.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/common/widgets/common_widgets.dart';
import 'package:test_site/common/widgets/navbar.dart';
import 'package:test_site/gen/assets.gen.dart';
import 'package:test_site/r.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = context.mediaQuery;
    return AnimationManager(
      child: Scaffold(
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
      padding: const EdgeInsets.only(
        top: 47,
        bottom: 183,
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
                          style: style1.copyWith(fontSize: 18),
                        ),
                        const SizedBox(height: 14),
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
                          onTap: () {},
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
