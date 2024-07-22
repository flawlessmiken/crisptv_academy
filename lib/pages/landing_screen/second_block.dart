import 'dart:ui';

import 'package:cripstv_academy/config/colors.dart';
import 'package:cripstv_academy/config/constants.dart';
import 'package:cripstv_academy/config/dimen.dart';
import 'package:cripstv_academy/pages/shared/view/animated_image_view.dart';
import 'package:cripstv_academy/pages/shared/widgets/custom_button.dart';
import 'package:cripstv_academy/pages/shared/widgets/custom_text.dart';
import 'package:cripstv_academy/pages/shared/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/router.dart';

class SecondBlock extends StatefulWidget {
  const SecondBlock({super.key});

  @override
  State<SecondBlock> createState() => _SecondBlockState();
}

class _SecondBlockState extends State<SecondBlock> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final verticalMargin = Dimen.verticalMarginHeight * 1.5;

      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal:
                ResponsiveWidget.isLargeScreen(maxWidth: constraints.maxWidth)
                    ? constraints.maxWidth * .05
                    : ResponsiveWidget.isMediumScreen(
                            maxWidth: constraints.maxWidth)
                        ? constraints.maxWidth * .06
                        : constraints.maxWidth * 0.04),
        child: Column(
          children: [
            Center(
              child: text("What We Offer?"),
            ),
            const CustomText(
              "The two majot things/ services are website is best at offering are:",
              maxLines: 3,
              style: TextStyle(
                  color: Color(0xFF667085),
                  fontWeight: FontWeight.w400,
                  fontSize: 21),
            ),
            SizedBox(height: verticalMargin),
            getWhatWeOffer(width: constraints.maxWidth),
            SizedBox(height: verticalMargin * 1.5),
            Center(
              child: text("Why Us?"),
            ),
            const CustomText(
              "The two majot things/ services are website is best at offering are: ",
              maxLines: 3,
              style: TextStyle(
                  color: Color(0xFF667085),
                  fontWeight: FontWeight.w400,
                  fontSize: 21),
            ),
            SizedBox(height: verticalMargin),
            getWhyUs(width: constraints.maxWidth),
          ],
        ),
      );
    });
  }

  Widget getWhatWeOffer({
    required double width,
  }) {
    return ResponsiveWidget(
      largeScreen: Row(
        children: [
          Expanded(
            child: getItem(
                text: "Customize Registration",
                image: "assets/images/landing_one.svg",
                backgroundColor: const Color(0xFFFF826C)),
          ),
          SizedBox(width: width * .01),
          Expanded(
            child: getItem(
                text: "Access Top Events",
                image: "assets/images/landing_two.svg",
                backgroundColor: const Color(0xFF7465CE)),
          ),
        ],
      ),
      mediumScreen: Row(
        children: [
          Expanded(
            child: getItem(
                text: "Customize Registration",
                image: "assets/images/landing_one.svg",
                backgroundColor: const Color(0xFFFF826C)),
          ),
          SizedBox(width: width * .01),
          Expanded(
            child: getItem(
                text: "Access Top Events",
                image: "assets/images/landing_two.svg",
                backgroundColor: const Color(0xFF7465CE)),
          ),
        ],
      ),
      smallScreen: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          getItem(
              text: "Customize Registration",
              image: "assets/images/landing_one.svg",
              backgroundColor: const Color(0xFFFF826C)),
          const SizedBox(height: Constants.screenHeight * .05),
          getItem(
              text: "Access Top Events",
              image: "assets/images/landing_two.svg",
              backgroundColor: const Color(0xFF7465CE)),
        ],
      ),
    );
  }

  Widget image({
    required double width,
    required double height,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: FittedBox(
          fit: BoxFit.cover,
          child: Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/talent.png'),
                fit: BoxFit.cover,
              ),
            ),
          )),
    );
  }

  Widget _whyUsText({
    required double width,
    required double height,
  }) {
    return Column(
      children: [
        const CustomText(
          "1. Find the best talents to work on your product",
          maxLines: 3,
          style: TextStyle(
              color: Color(0xFF667085),
              fontWeight: FontWeight.w400,
              fontSize: 21),
        ),
        SizedBox(height: height * .02),
        const CustomText(
          "1. Find the best talents to work on your product",
          maxLines: 3,
          style: TextStyle(
              color: Color(0xFF667085),
              fontWeight: FontWeight.w400,
              fontSize: 21),
        ),
        SizedBox(height: height * .02),
        const CustomText(
          "1. Find the best talents to work on your product",
          maxLines: 3,
          style: TextStyle(
              color: Color(0xFF667085),
              fontWeight: FontWeight.w400,
              fontSize: 21),
        ),
        SizedBox(height: height * .1),
        CustomButton(
          text: "Sign Up",
          onPressed: () {
            Get.toNamed(signUpAsRoute);
          },
          width: ResponsiveWidget.isSmallScreen()
              ? width
              : ResponsiveWidget.isMediumScreen()
                  ? width
                  : width * .7,
          height: Constants.screenHeight * 0.06,
        ),
      ],
    );
  }

  Widget getWhyUs({
    required double width,
  }) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          image(
            width: width * .4,
            height: Constants.screenHeight * 0.55,
          ),
          _whyUsText(
            width: width * .4,
            height: Constants.screenHeight * 0.55,
          ),
        ],
      ),
      smallScreen: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          image(
            width: width * .8,
            height: Constants.screenHeight * 0.55,
          ),
          const SizedBox(height: Constants.screenHeight * .05),
          _whyUsText(
            width: width * .4,
            height: Constants.screenHeight * 0.55,
          ),
        ],
      ),
    );
  }

  Widget text(String value, {Color color = CustomColors.grey}) {
    return ResponsiveWidget(
      largeScreen: baseText(value, 54, color),
      mediumScreen: baseText(value, 48, color),
      smallScreen: baseText(value, 42, color),
    );
  }

  Widget subtext(String value, {Color color = CustomColors.grey}) {
    return ResponsiveWidget(
      largeScreen: baseText(value, 54, color),
      mediumScreen: baseText(value, 48, color),
      smallScreen: baseText(value, 42, color),
    );
  }

  Widget baseText(String value, double fontSize, Color color,
      {FontWeight? fontwWeight}) {
    return CustomText(
      value,
      style: TextStyle(
          color: color, fontSize: fontSize, fontWeight: FontWeight.w700),
      textAlign: TextAlign.start,
      maxLines: 2,
    );
  }

  Widget getItem({
    required String text,
    required String image,
    required Color backgroundColor,
  }) {
    return ResponsiveWidget(
      largeScreen: AnimatedImage(
          index: 0,
          height: Constants.screenHeight * 0.55,
          text: text,
          image: image,
          backgroundColor: backgroundColor),
      mediumScreen: AnimatedImage(
          index: 1,
          height: Constants.screenHeight * 0.45,
          text: text,
          image: image,
          backgroundColor: backgroundColor),
      smallScreen: AnimatedImage(
          index: 2,
          height: Constants.screenHeight * 0.35,
          text: text,
          image: image,
          backgroundColor: backgroundColor),
    );
  }
}
