import 'package:car_pooling/controller/app_controller.dart';
import 'package:car_pooling/screen/recherches_page.dart';
import 'package:car_pooling/screen/reglage_pages.dart';
import 'package:car_pooling/screen/reservations_page.dart';
import 'package:car_pooling/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppController appController = Get.put(AppController());
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (controller) {
      return Scaffold(
          backgroundColor: AppTheme.black,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppTheme.black.withOpacity(0.8),
            selectedItemColor: AppTheme.primaryColor,
            unselectedItemColor: Colors.grey,
            currentIndex: controller.index,
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
              controller.changePage(value);
            },
          ),
          body: IndexedStack(
            index: controller.index,
            children: [
              const RecherchePage(),
              ReservationPage(),
              const ReglagesPage(),
            ],
          ));
    });
  }
}
