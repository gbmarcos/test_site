import 'package:flutter/material.dart';
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
            child: Column(
              children: [
                const Navbar(),
                Expanded(
                  child: Center(
                    child: Text(
                      state.selectedPage.pageName,
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: mediaQuery.size.height,
            color: Colors.white,
          ),
          SizedBox(
            height: mediaQuery.size.height,
            child: Center(
              child: Text(
                state.selectedPage.pageName,
                style: const TextStyle(fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
