import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class FigmaDesign extends StatelessWidget {
  const FigmaDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Flex(
        direction: context.isMobile ? Axis.vertical : Axis.horizontal,
        children: [
          "Some of my Designs, \n"
              .richText
              .withTextSpanChildren([
                "Not much but still an honest work..".textSpan.yellow400.make()
              ])
              .xl4
              .white
              .make(),
          20.widthBox,
          Expanded(
            child: VxSwiper(
              items: const [
                DesignWidget(image: "ss"),
                DesignWidget(image: "ss1"),
                DesignWidget(image: "ss3"),
                // DesignWidget(image: ""),
              ],
              height: 170,
              enlargeCenterPage: true,
              viewportFraction: context.isMobile ? 0.75 : 0.4,
              autoPlay: true,
              autoPlayInterval: 1.seconds,
            ),
          ),
        ],
      ).p64().h(context.isMobile ? 500 : 300),
    );
  }
}

class DesignWidget extends StatelessWidget {
  // final String title;
  final String image;
  const DesignWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.asset("$image.jpg")
        .box
        .p8
        .roundedLg
        .alignCenter
        .square(200)
        .neumorphic(color: Vx.purple700, elevation: 5.0, curve: VxCurve.flat)
        .make()
        .p16();
    // return title.text.bold.white.xl.wide.center
    //     .make()
    //     .box
    //     .p8
    //     .roundedLg
    //     .alignCenter
    //     .square(200)
    //     .neumorphic(color: Vx.purple700, elevation: 5.0, curve: VxCurve.flat)
    //     .make()
    //     .p16();
  }
}
