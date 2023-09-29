import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class MiddleScreen extends StatelessWidget {
  const MiddleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 68, 37, 96),
      child: Flex(
        direction: context.isMobile ? Axis.vertical : Axis.horizontal,
        children: [
          "Some of my works, \n"
              .richText
              .withTextSpanChildren(
                  ["Selected Project".textSpan.yellow400.make()])
              .xl4
              .white
              .make(),
          20.widthBox,
          Expanded(
            child: VxSwiper(
              items: const [
                ProjectWidget(
                  title: "Used car price prediction",
                  link: "used_car_price",
                ),
                ProjectWidget(
                  title: "Sonar rock vs mine prediction",
                  link: "sonar-rock-vs-mine-prediction",
                ),
                ProjectWidget(
                  title: "House price prediction",
                  link: "Advance-House-Pricing",
                ),
                ProjectWidget(
                  title: "song recommendation system which detects mood",
                  link: "",
                ),
                ProjectWidget(
                  title: "Red wine quality prediction",
                  link: "Red-Wine",
                ),
              ],
              height: 170,
              enlargeCenterPage: true,
              viewportFraction: context.isMobile ? 0.75 : 0.4,
              autoPlay: true,
              autoPlayInterval: 3.seconds,
            ),
          ),
        ],
      ).p64().h(context.isMobile ? 500 : 300),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  final String title;
  final String link;
  const ProjectWidget({super.key, required this.title, required this.link});

  @override
  Widget build(BuildContext context) {
    return title.text.bold.white.xl.wide.center
        .make()
        .box
        .p8
        .roundedLg
        .alignCenter
        .square(200)
        .neumorphic(color: Vx.purple700, elevation: 5.0, curve: VxCurve.flat)
        .make()
        .p16()
        .onTap(() {
      // string Uri url = Uri.("https://github.com/Yourownvibhore/used_car_price";
      final Uri url = Uri.parse("https://github.com/Yourownvibhore/$link");
      launchUrl(url);
    });
  }
}
