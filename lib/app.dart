import 'package:car_pooling/screen/recherches_page.dart';
import 'package:car_pooling/screen/reglage_pages.dart';
import 'package:car_pooling/screen/reservations_page.dart';
import 'package:car_pooling/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.black,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppTheme.black.withOpacity(0.8),
          selectedItemColor: AppTheme.primaryColor,
          unselectedItemColor: Colors.grey,
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              label: "Rechercher",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.square_list_fill),
              label: "Reservations",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_crop_circle),
              label: "Réglages",
            ),
          ],
          onTap: (value) {
            setState(() {
              if (index != value) {
                index = value;
              }
            });
          },
        ),
        body: IndexedStack(
          index: index,
          children: [
            const RecherchePage(),
            ReservationPage(),
            const ReglagesPage(),
          ],
        ));
  }
}
