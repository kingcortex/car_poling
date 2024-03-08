import 'package:car_pooling/model/data.dart';
import 'package:car_pooling/model/trajet.dart';
import 'package:car_pooling/theme/app_theme.dart';
import 'package:car_pooling/widget/home_trajet_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RecherchePage extends StatefulWidget {
  const RecherchePage({super.key});

  @override
  State<RecherchePage> createState() => _RecherchePageState();
}

class _RecherchePageState extends State<RecherchePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(
          top: 60,
          left: AppTheme.appPading,
          right: AppTheme.appPading,
        ),
        child: Column(
          children: [
            Text(
              "Reserver le trajet qui vous arrange",
              style: AppTheme.textStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(10),
            Text(
              "Choississez parmis les trajets suivant celui qui va vers votre direction",
              style: AppTheme.textStyle(),
            ),
            const Gap(33),
            for (Trajet trajet in Data.listTrajet)
              HomeTrajetWidget(trajet: trajet)
          ],
        ),
      ),
    );
  }
}
