import 'package:car_pooling/model/trajet.dart';
import 'package:car_pooling/screen/detail_trajet_page.dart';
import 'package:car_pooling/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomeTrajetWidget extends StatefulWidget {
  final Trajet trajet;
  const HomeTrajetWidget({super.key, required this.trajet});

  @override
  State<HomeTrajetWidget> createState() => _HomeTrajetWidgetState();
}

class _HomeTrajetWidgetState extends State<HomeTrajetWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> leftToRightSlide;
  late Animation<Offset> rightToLeftSlide;
  late Animation<double> scaleTransition;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 999));

    leftToRightSlide =
        Tween<Offset>(begin: const Offset(-0.1, 0), end: const Offset(0, 0))
            .animate(controller);
    rightToLeftSlide =
        Tween<Offset>(begin: const Offset(0.1, 0.0), end: const Offset(0, 0))
            .animate(controller);

    scaleTransition = Tween<double>(begin: 1, end: 0).animate(controller);

    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: InkWell(
        onTap: () {
          Get.to(
            () => const DetailTrajetPage(),
            transition: Transition.rightToLeft,
            duration: const Duration(milliseconds: 500),
            arguments: widget.trajet
          );
        },
        child: SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width - AppTheme.appPading * 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return SlideTransition(
                      position: leftToRightSlide,
                      child: Stack(
                        children: [
                          ScaleTransition(
                            scale: scaleTransition,
                            child: Container(
                              height: 85,
                              width: 110,
                              decoration: BoxDecoration(
                                color: AppTheme.primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          Container(
                            height: 90,
                            width: MediaQuery.of(context).size.width < 400
                                ? 130
                                : 180,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(widget.trajet.imageCarPath),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
              const Gap(25),
              SlideTransition(
                position: rightToLeftSlide,
                child: detailSection(context: context, trajet: widget.trajet),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget detailSection({required BuildContext context, required Trajet trajet}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: SizedBox(
      height: 90,
      width: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              symbol(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trajet.start,
                    style: AppTheme.textStyle(),
                  ),
                  const Gap(10),
                  Text(
                    trajet.end,
                    style: AppTheme.textStyle(),
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                trajet.modelCar,
                style: AppTheme.textStyle(),
              ),
              Text(
                "${trajet.price} XOF",
                style: AppTheme.textStyle(),
              )
            ],
          )
        ],
      ),
    ),
  );
}

Widget symbol() {
  return SizedBox(
    width: 20,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 5,
          backgroundColor: AppTheme.primaryColor,
        ),
        const Gap(5),
        Container(
          width: 1,
          height: 15,
          color: AppTheme.textColor,
        ),
        const Gap(5),
        CircleAvatar(
          radius: 3,
          backgroundColor: AppTheme.textColor,
        ),
      ],
    ),
  );
}
