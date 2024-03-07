import 'package:car_pooling/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ReglagesPage extends StatelessWidget {
  const ReglagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar.medium(
          expandedHeight: 90,
          centerTitle: true,
          backgroundColor: AppTheme.black,
          title: Text(
            "Reglages",
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
            child: Column(
              children: [
                //Titre
                customContainer(
                  context,
                  85,
                  "Ezecgiel",
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/profile-pic.png"))),
                  ),
                  isTitle: true,
                  borderRadius: BorderRadius.circular(8),
                ),
                const Gap(30),
                customContainer(
                  context,
                  42.25,
                  "Partager m'application",
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green,
                    ),
                    child: Icon(
                      CupertinoIcons.share_solid,
                      color: AppTheme.textColor,
                    ),
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  isTitle: false,
                ),
                customContainer(
                  context,
                  42.25,
                  "Information sur l'application",
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blueAccent,
                    ),
                    child: Icon(
                      CupertinoIcons.info,
                      color: AppTheme.textColor,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(0),
                  isTitle: false,
                ),
                customContainer(
                  context,
                  45,
                  "Nous contacter",
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.yellowAccent,
                    ),
                    child: Icon(
                      CupertinoIcons.phone_fill,
                      color: AppTheme.textColor,
                    ),
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  isTitle: false,
                ),
                const Gap(30),
                customContainer(
                  context,
                  45,
                  "Partager m'application",
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.purpleAccent,
                    ),
                    child: Icon(
                      CupertinoIcons.info,
                      color: AppTheme.textColor,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(8),
                  isTitle: false,
                ),
                Gap(200)
              ],
            ),
          ),
        )
      ],
    );
  }
}

Widget customContainer(
    BuildContext context, double height, String text, Widget leading,
    {required bool isTitle, required BorderRadius borderRadius}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    height: height,
    width: MediaQuery.of(context).size.width - AppTheme.appPading * 2,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 94, 91, 91).withOpacity(0.2),
      borderRadius: borderRadius,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            leading,
            const Gap(10),
            Text(
              text,
              style: isTitle
                  ? AppTheme.textStyle(fontSize: 30)
                  : AppTheme.textStyle(),
            )
          ],
        ),
        const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.grey,
        )
      ],
    ),
  );
}
