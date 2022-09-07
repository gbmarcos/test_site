import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/screens/screens.dart';

export 'package:beamer/beamer.dart';

final routerDelegate = BeamerDelegate(
  locationBuilder: (routeInformation, _) {
    return CustomPageLocation(routeInformation);
  },
);

enum SitePage{

  home(path:'/',pageName: 'Home'),
unternehmensberatung(path:'/unternehmensberatung',pageName: 'Unternehmensberatung'),
ruckabwicklung(path:'/ruckabwicklung',pageName: 'Rückabwicklung'),
investment(path:'/investment',pageName: 'Vermögensschutz & Investment.');


 static SitePage fromPath(String? path){
   if(path==null) return SitePage.home;
   return values.firstWhere((page) => page.path == path);
 }

  const SitePage({required this.path,required this.pageName});
  final String path;
  final String pageName;

}

enum NavigationOption{

  home(pageName: 'Home',scrollIndex: 0),
  uberUns(pageName: 'Über Uns',scrollIndex: 3),
  kompetenzen(pageName: 'Kompetenzen',scrollIndex: 4),
  vision(pageName: 'Vision',scrollIndex: 8),
  news(pageName: 'News',scrollIndex: 0),
  team(pageName: 'Team',scrollIndex: 9),
  karriere(pageName: 'Karriere',scrollIndex: 0);

const NavigationOption({required this.pageName,required this.scrollIndex});
final String pageName;
final int scrollIndex;

}




class CustomPageLocation extends BeamLocation<CustomPageState> {


  CustomPageLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  CustomPageState createState(RouteInformation routeInformation) =>
      CustomPageState().fromRouteInformation(routeInformation);

  @override
  void initState() {
    super.initState();
    state.addListener(notifyListeners);
  }

  @override
  void updateState(RouteInformation routeInformation) {
    final pageState = CustomPageState().fromRouteInformation(routeInformation);
    state.selectedPage = pageState.selectedPage;
  }

  @override
  void disposeState() {
    state.removeListener(notifyListeners);
    super.disposeState();
  }

  @override
  List<Pattern> get pathPatterns => [];

  @override
  List<BeamPage> buildPages(BuildContext context, CustomPageState state) {


    late Widget page;

    switch (state.selectedPage.page) {
      case SitePage.home:
        page = const HomeScreen();
        break;
      case SitePage.unternehmensberatung:
        page = const UberUnsScreen();
        break;
      case SitePage.ruckabwicklung:
        page = const KompetenzenScreen();
        break;
      case SitePage.investment:
        page = const VisionScreen();
        break;

    }

    final name = state.selectedPage.page.pageName;
    return [
      BeamPage(
        key: ValueKey(name),
        title: name,
        child: page,
        type: BeamPageType.fadeTransition,
      )
    ];
  }
}

class PageStateData {
  const PageStateData({this.page = SitePage.home, this.section =0});
  final SitePage page ;
  final int section;
}

class CustomPageState extends ChangeNotifier with RouteInformationSerializable {

  PageStateData _selectedPage = const PageStateData();

  PageStateData get selectedPage => _selectedPage;

  set selectedPage(PageStateData page) {
    _selectedPage = page;
    notifyListeners();
  }

  @override
  CustomPageState fromRouteInformation(RouteInformation routeInformation) {
    selectedPage = PageStateData(page: SitePage.fromPath(routeInformation.location),);
    return this;
  }

  @override
  RouteInformation toRouteInformation() => RouteInformation(location: _selectedPage.page.path);
}

void onNavigationActionSelect({
  required NavigationOption page,
  required BuildContext context,
}) {
  context.customPageState.selectedPage = PageStateData(
    section: page.scrollIndex,
  );
}