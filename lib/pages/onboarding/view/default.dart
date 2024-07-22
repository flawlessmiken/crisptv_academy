import 'dart:math' as math;

import 'package:cripstv_academy/pages/onboarding/view/set_up_profile.dart';
import 'package:cripstv_academy/pages/onboarding/view/sign_in_as.dart';
import 'package:cripstv_academy/pages/onboarding/view/sign_up_as.dart';
import 'package:cripstv_academy/pages/onboarding/view/talent_sign_in.dart';
import 'package:cripstv_academy/pages/onboarding/view/talent_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cripstv_academy/app.dart';
import 'package:cripstv_academy/config/config.dart';
import 'package:cripstv_academy/pages/shared/shared.dart';

import 'view.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pages = [
      "sign_in",
      "talent_sign_in",
      "sign_up",
      "talent_sign_up",
      "set_up_profile",
      "sign_up_as",
      "sign_in_as",
      "verify_email",
      "reset_password",
      "verify_password_reset",
    ];

    final backgrounds = [
      "assets/images/recruiter_sign_up.png",
      "assets/images/recruiter_sign_up.png",
      "assets/images/recruiter_sign_up.png",
      "assets/images/tanlent_singup.png",
      "assets/images/tanlent_singup.png",
      "assets/images/sign_up_as.png",
      "assets/images/sign_up_as.png",
      "assets/images/recruiter_sign_up.png",
      "assets/images/recruiter_sign_up.png",
      "assets/images/recruiter_sign_up.png",
    ];

    return LayoutBuilder(builder: (context, constraints) {
      final availableWidth = constraints.maxWidth;

      final screens = [
        const SignIn(),
        const TalentSignIn(),
        const SignUp(),
        const TalentSignUP(),
        const SetUpProfile(),
        const SignUpAs(),
        const SignInAs(),
        const VerifyEmail(),
        const ResetPassword(),
        const VerifyPasswordReset(),
      ];

      return Scaffold(
        appBar: null,
        backgroundColor: CustomColors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: App.screenHeight,
            child: Row(
              children: [
                if (ResponsiveWidget.isLargeScreen(maxWidth: availableWidth))
                  Expanded(
                      child: background(backgrounds[
                          pages.indexOf(Get.currentRoute.split('/').last)])),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (!ResponsiveWidget.isLargeScreen())
                        background(backgrounds[
                            pages.indexOf(Get.currentRoute.split('/').last)]),
                      Container(
                        height: double.infinity,
                        color: Colors.transparent,
                        child: LoadingWrapper(
                          child: Container(
                            width: availableWidth * 0.85,
                            decoration: BoxDecoration(
                                color: CustomColors.white,
                                borderRadius: BorderRadius.circular(20)),
                            margin: const EdgeInsets.symmetric(
                                vertical: Constants.screenHeight * 0.075),
                            child:
                                LayoutBuilder(builder: (context, constraints) {
                              final width = constraints.maxWidth;
                              final height = constraints.maxHeight;

                              const verticalMargin =
                                  Constants.screenHeight * 0.02;

                              return Column(
                                children: [
                                  const Expanded(child: SizedBox()),
                                  SizedBox(
                                    height: height * 0.9,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: verticalMargin),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: (width * 0.15) -
                                                40 -
                                                Dimen.horizontalMarginWidth,
                                            right: width * 0.15,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 40,
                                                child: Center(
                                                  child: IconButton(
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    icon: const RotatedBox(
                                                        quarterTurns: 1,
                                                        child: SVG(
                                                            'assets/icons/arrow_i.svg',
                                                            height: 24,
                                                            width: 24,
                                                            color: CustomColors
                                                                .grey,
                                                            semanticsLabel:
                                                                "Back")),
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      height: 40,
                                                      width: 32,
                                                      child: FittedBox(
                                                        fit: BoxFit.fitHeight,
                                                        child: Image.asset(
                                                            'assets/images/aclogo.png'),
                                                      ),
                                                    ),
                                                    const CustomText(
                                                        "Crisp TV Academy",
                                                        style: TextStyle(
                                                            color: CustomColors
                                                                .grey,
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800)),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 40),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: ResponsiveWidget
                                                      .isLargeScreen()
                                                  ? width * 0.19
                                                  : ResponsiveWidget
                                                          .isMediumScreen()
                                                      ? width * 0.16
                                                      : width * 0.12,
                                            ),
                                            child: Column(
                                              children: [
                                                const SizedBox(
                                                    height: verticalMargin),
                                                Expanded(
                                                  child: SizedBox(
                                                      height: double.infinity,
                                                      child: PageStorage(
                                                          bucket:
                                                              PageStorageBucket(),
                                                          child: screens[
                                                              pages.indexOf(Get
                                                                  .currentRoute
                                                                  .split('/')
                                                                  .last)])),
                                                ),
                                                const SizedBox(
                                                    height: verticalMargin),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Expanded(child: SizedBox())
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget background(String backgroundImage) {
    return SizedBox(
      height: App.screenHeight,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(math.pi),
        child: Container(
          height: App.screenHeight,
          decoration: BoxDecoration(
            color: const Color(0xFFFF826C),
            image: DecorationImage(
              image: AssetImage(backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
