import 'package:car_pooling/model/trajet.dart';
import 'package:car_pooling/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ResevationTile extends StatelessWidget {
  final Trajet trajet;
  const ResevationTile({super.key, required this.trajet});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 84,
      width: MediaQuery.of(context).size.width,
      //decoration: BoxDecoration(
      //border: Border.all(width: 1, color: AppTheme.primaryColor),
      //borderRadius: BorderRadius.circular(8),
      //    ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.directions_walk,
                size: 20,
                color: AppTheme.textColor,
              ),
              Text(
                "${trajet.start} -----",
                style: AppTheme.textStyle(),
              ),
              Icon(
                Icons.fmd_good,
                color: AppTheme.primaryColor,
                size: 20,
              ),
              Text(
                trajet.end,
                style: AppTheme.textStyle(),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  trajet.modelCar,
                  style: AppTheme.textStyle(),
                ),
              ),
              Text(
                "${trajet.price} XOF",
                style: AppTheme.textStyle(),
              )
            ],
          )
        ],
      ),
    );
  }
}
