import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:test_site/common/extensions.dart';
import 'package:test_site/common/widgets/common_widgets.dart';
import 'package:test_site/r.dart';

export 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CustomScrollablePositionedList extends StatelessWidget {
  const CustomScrollablePositionedList({
    Key? key,
    required this.itemScrollController,
    required this.itemPositionsListener,
    required this.sections,
  }) : super(key: key);

  final ItemScrollController itemScrollController;
  final ItemPositionsListener itemPositionsListener;
  final List<Widget> sections;

  @override
  Widget build(BuildContext context) {
    final beamerState = context.customPageState;

    return MultiProvider(
      providers: [
        Provider<ItemScrollController>.value(value: itemScrollController),
        Provider<ItemPositionsListener>.value(value: itemPositionsListener),
      ],
      builder: (context, child) {
        return AnimationManager(
          child: Scaffold(
            body: ScrollablePositionedList.builder(
              initialScrollIndex: beamerState.selectedPage.section,
              padding: EdgeInsets.zero,
              itemCount: sections.length,
              itemScrollController: context.read(),
              itemPositionsListener: context.read(),
              itemBuilder: (context, index) => sections[index],
            ),
            floatingActionButton: AnimatedBuilder(
              animation: itemPositionsListener.itemPositions,
              builder: (context, _) {
                final index = itemPositionsListener.itemPositions.value.first.index;
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: index < 1
                      ? const SizedBox.shrink()
                      : FloatingActionButton.small(
                    elevation: 3,
                    onPressed: () async {
                      await itemScrollController.scrollTo(
                        index: 0,
                        duration: Duration(
                            milliseconds:
                            (itemPositionsListener.itemPositions.value.first.index + 1) *
                                200),
                        curve: Curves.easeInOutCubic,
                      );
                    },
                    backgroundColor: R.colors.buttonColor.withOpacity(0.8),
                    child: const Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.black,
                      size: 28,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}