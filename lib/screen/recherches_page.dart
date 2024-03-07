import 'package:car_pooling/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RecherchePage extends StatelessWidget {
  const RecherchePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
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
          )
        ],
      ),
    );
  }
}
