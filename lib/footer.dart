import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:portfoo/header.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        VxDevice(
            mobile: VStack(
              [
                "Got a Project?\nLet's Talk".text.center.white.xl2.make(),
                20.heightBox,
                ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {
                          String email =
                              Uri.encodeComponent("vjmj4005@gmail.com");
                          Uri mail = Uri.parse("mailto:$email");
                          launchUrl(mail);
                        },
                        child: "vjmj4005@gmail.com"
                            .text
                            .center
                            .color(Colors.white)
                            .semiBold
                            .xl
                            .make())
                    .wh(250, 50)
                    .cornerRadius(10)
              ],
              crossAlignment: CrossAxisAlignment.center,
            ),
            web: HStack(
              [
                "Got a Project?\nLet's Talk".text.white.center.xl2.make(),
                10.widthBox,
                ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {
                          // final Uri email =
                          //     Uri(scheme: 'mailto', path: 'vjmj4005@gmail.com');

                          String email =
                              Uri.encodeComponent("vjmj4005@gmail.com");
                          Uri mail = Uri.parse("mailto:$email");
                          launchUrl(mail);
                        },
                        child: "vjmj4005@gmail.com"
                            .text
                            .center
                            .color(Colors.white)
                            .semiBold
                            // .xl
                            .make())
                    .wh(250, 50)
                    .cornerRadius(10)
              ],
              alignment: MainAxisAlignment.spaceAround,
            ).w(context.safePercentWidth * 70).scale150().p16()),
        50.heightBox,
        const CustomAppBar(),
        10.heightBox,
        "Thanks for scrolling, ".richText.semiBold.white.withTextSpanChildren(
            ["that's all folks.".textSpan.gray500.make()]).make(),
        10.heightBox,
        [
          "Proudly Made in India with ".text.red500.make(),
          10.widthBox,
          const Icon(
            AntDesign.heart,
            color: Vx.red500,
            size: 14,
          ).shimmer(
            primaryColor: Vx.red500,
          ),
        ].hStack(
            crossAlignment: CrossAxisAlignment.center,
            alignment: MainAxisAlignment.center),
        ["by Vibhore Jain".text.red500.make()]
            .hStack(alignment: MainAxisAlignment.center)
      ],
      crossAlignment: CrossAxisAlignment.center,
    ).wFull(context).p16();
  }
}
