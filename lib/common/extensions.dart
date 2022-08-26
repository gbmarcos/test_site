import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_site/app/navigation/beamer_router.dart';


extension BuilContextX on BuildContext{
  CustomPageState get customPageState => currentBeamLocation.state as CustomPageState;
}
