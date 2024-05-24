import 'package:flutter/material.dart';

import 'destinations.dart';
import 'routes.dart';

class NavigationSideBar extends StatelessWidget {
  const NavigationSideBar({super.key});

  static final index = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: index,
      builder: (context, value, child) {
        return NavigationRail(
          destinations: [
            ...destinations.map(
              (e) => NavigationRailDestination(
                icon: destinations.indexOf(e) == index.value
                    ? Container(
                        height: 48,
                        width: 48,
                        color: Colors.green,
                        child: Icon(e.$1, color: Colors.white),
                      )
                    : Icon(e.$1),
                label: const SizedBox.shrink(),
              ),
            ),
          ],
          selectedIndex: index.value,
          onDestinationSelected: (value) {
            index.value = value;
            Routes.i.pushReplacementNamed(destinations[value].$2);
          },
          useIndicator: false,
          groupAlignment: -0.8,
        );
      },
    );
  }
}
