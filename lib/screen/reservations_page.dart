import 'package:car_pooling/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar.medium(
          expandedHeight: 85,
          centerTitle: true,
          backgroundColor: AppTheme.black,
          title: Text(
            "Reservations",
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
            child: const Column(),
          ),
        )
      ],
    );
  }
}
