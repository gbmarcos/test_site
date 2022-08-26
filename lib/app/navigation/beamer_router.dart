import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:test_site/screens/screens.dart';

export 'package:beamer/beamer.dart';

final routerDelegate = BeamerDelegate(
  locationBuilder: (routeInformation, _) {
    return CustomPageLocation(routeInformation);
  },
);

enum SitePage{

  home(path:'/',pageName: 'Home'),
  uberUns(path:'/uberUns',pageName: 'Über Uns'),
  kompetenzen(path:'/kompetenzen',pageName: 'Kompetenzen'),
  vision(path:'/vision',pageName: 'Vision'),
  news(path:'/news',pageName: 'News'),
  team(path:'/team',pageName: 'Team'),
  karriere(path:'/karriere',pageName: 'Karriere');

 static SitePage fromPath(String? path){
   if(path==null) return SitePage.home;
   return values.firstWhere((page) => page.path == path);
 }

  const SitePage({required this.path,required this.pageName});
  final String path;
  final String pageName;

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

    switch (state.selectedPage) {
      case SitePage.home:
        page = const HomeScreen();
        break;
      case SitePage.uberUns:
        page = const UberUnsScreen();
        break;
      case SitePage.kompetenzen:
        page = const KompetenzenScreen();
        break;
      case SitePage.vision:
        page = const VisionScreen();
        break;
      case SitePage.news:
        page = const NewsScreen();
        break;
      case SitePage.team:
        page = const TeamScreen();
        break;
      case SitePage.karriere:
        page = const KarriereScreen();
        break;
    }

    final name = state.selectedPage.pageName;
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

class CustomPageState extends ChangeNotifier with RouteInformationSerializable {

  SitePage _selectedPage = SitePage.home;

  SitePage get selectedPage => _selectedPage;

  set selectedPage(SitePage page) {
    _selectedPage = page;
    notifyListeners();
  }

  @override
  CustomPageState fromRouteInformation(RouteInformation routeInformation) {
    selectedPage = SitePage.fromPath(routeInformation.location);
    return this;
  }

  @override
  RouteInformation toRouteInformation() => RouteInformation(location: _selectedPage.path);
}