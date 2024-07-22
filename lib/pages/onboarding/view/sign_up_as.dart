import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';


import 'package:cripstv_academy/core/core.dart';
import 'package:cripstv_academy/config/config.dart';
import 'package:cripstv_academy/pages/shared/shared.dart';

class SignUpAs extends HookWidget {
  const SignUpAs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AuthRepository>(context);

    const verticalMargin = Constants.screenHeight * 0.02;

    return Column(children: [
      SizedBox(
          height: ResponsiveWidget.isSmallScreen()
              ? verticalMargin
              : verticalMargin * 2),
      text("Sign Up As?"),
      const SizedBox(height: verticalMargin * .25),
      CustomText(
        "We are excited to have your here. Kindly select a category. "
        "This will help us personalize your experience.",
        maxLines: 2,
        style: TextStyles(color: CustomColors.grey).textBodyLarge,
      ),
      const SizedBox(height: verticalMargin * 2),
      LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth;
        return CustomButton(
          text: "A Recruiter",
          width: ResponsiveWidget.isSmallScreen() ? width * .9 : width * .7,
          height: Constants.screenHeight * 0.06,
          onPressed: () async {
            Get.toNamed(signUpRoute);
          },
        );
      }),
      const SizedBox(height: verticalMargin * 1),
      LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth;
        return CustomButton(
          text: "A Talent",
          width: ResponsiveWidget.isSmallScreen() ? width * .9 : width * .7,
          height: Constants.screenHeight * 0.06,
          isOutlined: true,
          onPressed: () async {
             Get.toNamed(talentSignUpRoute);
          },
        );
      }),
      const SizedBox(height: verticalMargin),
    ]);
  }

  Widget text(String value, {Color color = CustomColors.grey}) {
    return ResponsiveWidget(
      largeScreen: baseText(value, 50, color),
      mediumScreen: baseText(value, 42, color),
      smallScreen: baseText(value, 32, color),
    );
  }

  Widget baseText(String value, double fontSize, Color color) {
    return CustomText(
      value,
      style: TextStyle(
          color: color, fontSize: fontSize, fontWeight: FontWeight.w700),
      textAlign: TextAlign.center,
      maxLines: 2,
    );
  }
}
