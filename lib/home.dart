import 'package:flutter/material.dart';
import 'package:portfoo/coolors.dart';
import 'package:portfoo/design.dart';
import 'package:portfoo/footer.dart';
import 'package:portfoo/header.dart';
import 'package:portfoo/middle.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Coolers.primaryColor,
      child: VStack([
        const HeaderScreen(),
        if (context.isMobile) const IntroductionWidget().p8(),
        const MiddleScreen(),
        const FigmaDesign(),
        const FooterScreen()
      ]).scrollVertical(),
    );
  }
}
