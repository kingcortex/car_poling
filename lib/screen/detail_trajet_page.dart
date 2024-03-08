import 'package:car_pooling/model/trajet.dart';
import 'package:car_pooling/theme/app_theme.dart';
import 'package:car_pooling/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class DetailTrajetPage extends StatefulWidget {
  const DetailTrajetPage({super.key});

  @override
  State<DetailTrajetPage> createState() => _DetailTrajetPageState();
}

class _DetailTrajetPageState extends State<DetailTrajetPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slideTransition;
  Trajet trajet = Get.arguments as Trajet;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1499));
    slideTransition =
        Tween<Offset>(begin: const Offset(0.2, 0.0), end: Offset.zero)
            .animate(controller);

    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme.black,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppTheme.textColor,
            )),
        title: Text(
          "Details",
          style: AppTheme.textStyle(),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close,
              color: AppTheme.textColor,
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/map.jpeg"), fit: BoxFit.fitHeight),
        ),
        child: Column(
          children: [
            const Expanded(
              flex: 3,
              child: SizedBox(),
            ),
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 100),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        left: AppTheme.appPading,
                        right: AppTheme.appPading,
                        top: 60,
                        bottom: 20),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customContainer(
                                icon: Icons.directions_car, text: "Confort"),
                            customContainer(icon: Icons.group, text: "5"),
                            customContainer(icon: Icons.av_timer, text: "auto")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  trajet.modelCar,
                                  style: AppTheme.textStyle(fontSize: 25),
                                ),
                                Text(
                                  "${trajet.price} XOF",
                                  style: AppTheme.textStyle(),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  trajet.end,
                                  style: AppTheme.textStyle(),
                                ),
                                Text(
                                  "${trajet.time} heures",
                                  style: AppTheme.textStyle(),
                                )
                              ],
                            )
                          ],
                        ),
                        CustomButton(
                          text: Text(
                            "Reserver",
                            style: AppTheme.textStyle(fontSize: 20),
                          ),
                          height: 50,
                          width: double.infinity,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: MediaQuery.of(context).size.width / 2 - 200,
                    child: SlideTransition(
                      position: slideTransition,
                      child: Container(
                        height: 150,
                        width: 400,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(trajet.imageCarPath),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

Widget customContainer({required IconData icon, required String text}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
    decoration: BoxDecoration(
      color: AppTheme.primaryColor,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Icon(
          icon,
          color: AppTheme.textColor,
          size: 16,
        ),
        const Gap(5),
        Text(
          text,
          style: AppTheme.textStyle(),
        ),
      ],
    ),
  );
}
