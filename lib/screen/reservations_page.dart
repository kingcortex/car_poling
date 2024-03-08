import 'package:car_pooling/controller/reservation_controller.dart';
import 'package:car_pooling/theme/app_theme.dart';
import 'package:car_pooling/widget/reservation_tile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ReservationPage extends StatelessWidget {
  ReservationPage({super.key});

  final ReservationsController reservationsController =
      Get.put(ReservationsController());

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar.medium(
          expandedHeight: 85,
          centerTitle: true,
          backgroundColor: AppTheme.black,
          title: Text(
            "Mes reservations",
            style: AppTheme.textStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: AppTheme.appPading,
              right: AppTheme.appPading,
            ),
            child: GetBuilder<ReservationsController>(
              builder: (controller) {
                if (controller.reservations.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Gap(MediaQuery.of(context).size.height / 3 - 50),
                      Icon(
                        Icons.error,
                        size: 40,
                        color: AppTheme.primaryColor,
                      ),
                      Text(
                        "Aucune reservation",
                        style: AppTheme.textStyle(fontSize: 20),
                      ),
                      const Gap(5),
                      Text(
                        "Nous avons trouvé aucune réservation",
                        style: AppTheme.textStyle(fontSize: 12),
                      ),
                      const Gap(5),
                    ],
                  );
                } else {
                  return Column(
                    children: controller.reservations
                        .map((trajet) => ResevationTile(trajet: trajet))
                        .toList(),
                  );
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
