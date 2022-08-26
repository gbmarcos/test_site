import 'package:flutter/material.dart';
import 'package:test_site/common/extensions.dart';
import '../../common/widgets/navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.customPageState;
    return Scaffold(
      body: Column(
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
    );
  }
}
