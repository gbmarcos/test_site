import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_site/common/extensions.dart';
import '../../common/widgets/navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.customPageState;
    final mediaQuery = context.mediaQuery;
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: mediaQuery.size.height,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/AdobeStock_342564835_Editorial_Use_Only_1.png',
                    ),
                    scale: 1.3),
              ),
              child: Column(
                children: [
                  const Navbar(),
                  Expanded(
                    child: Center(
                      child: Text(
                        state.selectedPage.pageName,
                        style: TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(
                                color: Colors.black.withAlpha(50),
                                blurRadius: 1.8,
                                offset: const Offset(0, 5))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: mediaQuery.size.height,
            color: Colors.white,
          ),
          SizedBox(
            height: mediaQuery.size.height,
          ),
        ],
      ),
    );
  }
}
