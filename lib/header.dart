import 'dart:math';

import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:portfoo/coolors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var nameWidget = "Vibhore\n Jain"
        .text
        .white
        .xl6
        .lineHeight(1)
        .size(context.isMobile ? 15 : 20)
        .bold
        .make()
        .shimmer();
    return SafeArea(
      child: VxBox(
          child: VStack([
        ZStack([
          Row(
              mainAxisAlignment: context.isMobile
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.spaceEvenly,
              // mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: const [PictureWidget()]),
          Row(
            children: [
              VStack([
                if (context.isMobile) 50.heightBox else 10.heightBox,
                const CustomAppBar().shimmer(primaryColor: Coolers.accentColor),
                30.heightBox,
                nameWidget,
                20.heightBox,
                VxBox()
                    .color(Coolers.accentColor)
                    .size(60, 10)
                    .make()
                    .px4()
                    .shimmer(primaryColor: Coolers.accentColor),
                30.heightBox,
                const SocialAccounts()
              ]).pSymmetric(h: context.percentWidth * 5, v: 32),
              context.isMobile ? 0.widthBox : 80.widthBox,
              Expanded(
                  child: VxResponsive(
                fallback: const Offstage(),
                medium: const IntroductionWidget()
                    .pOnly(left: 120)
                    .h(context.percentHeight * 60),
                large: const IntroductionWidget()
                    .pOnly(left: 120)
                    .h(context.percentHeight * 60),
              ))
            ],
          ).w(context.screenWidth)
        ])
      ])).make(),
    );
  }
}

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri resume = Uri.parse(
        "https://drive.google.com/file/d/1sTQmaXcF3WoGZpB9Mkb09om9FkNY4Sbp/view?usp=drive_link");
    return VStack(
      [
        [
          20.widthBox,
          context.isMobile ? 50.heightBox : 10.heightBox,
          "About Me"
              .text
              .gray500
              .widest
              .sm
              // .lineHeight(1)
              // .size(context.isMobile ? 15 : 20)
              .make()
              .shimmer(primaryColor: Coolers.accentColor),
          50.heightBox,
          "I am just a designer with sound knowledge of Figma and can design a good website and app and more stuff like this .I have also good knowledge of flutter.Oh did i forget to tell I'm in ML also.."
              .text
              .white
              .size(context.isMobile ? 15 : 20)
              .maxFontSize(18)
              .maxLines(context.isMobile ? 8 : 5)
              .make()
              .shimmer()
              .w(context.isMobile
                  ? context.screenWidth
                  : context.percentWidth * 40),
          context.isMobile ? 20.heightBox : 10.heightBox,
        ].vStack(),
        // context.isMobile ? 50.widthBox : 0.widthBox,
        ElevatedButton(
                onPressed: () {
                  launchUrl(resume);
                },
                child: "See my Resume"
                    .text
                    .white
                    .make()
                    .shimmer(primaryColor: Colors.white))
            // .shimmer(primaryColor: Coolers.accentColor)
            .wh(
                context.isMobile
                    ? context.screenWidth
                    : context.percentWidth * 40,
                // 250,
                50)
            .cornerRadius(10)

        // .shimmer(primaryColor: Coolers.accentColor),
      ],
      alignment: MainAxisAlignment.spaceEvenly,
    );
  }
}

class PictureWidget extends StatelessWidget {
  const PictureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Transform(
          transform: Matrix4.rotationY(pi),
          // alignment: Alignment.centerLeft,
          alignment: context.isMobile ? Alignment.center : Alignment.centerLeft,
          child: Image.asset(
            "assets/do1.png",
            fit: BoxFit.cover,
            height: context.percentHeight * 60,
            // alignment: Alignment.centerRight,
            alignment:
                context.isMobile ? Alignment.bottomRight : Alignment.center,
          )
          // Image(
          //   image: AssetImage("assets/do.jpg"),
          //   alignment: Alignment.center,
          ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      AntDesign.dashboard,
      size: 50,
      color: Coolers.accentColor,
    );
  }
}

class SocialAccounts extends StatelessWidget {
  const SocialAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri twi = Uri.parse("https://twitter.com/vibhorejain4");
    final Uri instagram =
        Uri.parse("https://www.instagram.com/yourownvibhore1/");
    final Uri linkdin = Uri.parse("https://www.linkedin.com/in/vibhorejain1");
    final Uri github = Uri.parse("https://github.com/Yourownvibhore");
    return [
      const Icon(AntDesign.twitter, color: Colors.white).mdClick(() async {
        if (await canLaunchUrl(twi)) {
          await launchUrl(twi);
        } else {
          throw 'Sorry! Some technical issue';
        }
        // launchUrl(url);
      }).make(),
      20.widthBox,
      const Icon(AntDesign.instagram, color: Colors.white).mdClick(() async {
        if (await canLaunchUrl(instagram)) {
          await launchUrl(instagram);
        } else {
          throw 'Sorry! Some technical issue.';
        }
      }).make(),
      20.widthBox,
      const Icon(AntDesign.linkedin_square, color: Colors.white).mdClick(() async {
        if (await canLaunchUrl(linkdin)) {
          await launchUrl(linkdin);
        } else {
          throw 'Sorry! Some technical issue.';
        }
      }).make(),
      20.widthBox,
      const Icon(AntDesign.github, color: Colors.white)
          .mdClick(() async {
            if (await canLaunchUrl(github)) {
              await launchUrl(github);
            } else {
              throw 'Sorry! Some technical issue.';
            }
          })
          .make()
          .px4(),
    ].hStack();
  }
}
