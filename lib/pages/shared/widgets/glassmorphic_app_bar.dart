import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cripstv_academy/config/config.dart';
import 'package:cripstv_academy/core/core.dart';

import '../shared.dart';

class GlassmorphicAppBar extends StatelessWidget {
  final double? height;
  final bool? showName;
  final bool replaceChild;
  final bool showOnboarding;
  final Widget? child;

  const GlassmorphicAppBar(
      {Key? key,
      this.height,
      this.showName,
      this.replaceChild = false,
      this.child,
      this.showOnboarding = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userLoggedIn = SessionManager.instance.userLoggedIn;

    return Container(
      height: height ?? Constants.screenHeight * 0.13,
      color: Colors.transparent,
      child: Stack(
        children: [
          SizedBox(
            height: Constants.screenHeight * 0.13,
            width: double.infinity,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  decoration:
                      BoxDecoration(color: CustomColors.white.withOpacity(.45)),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: Constants.screenHeight * 0.13,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: LayoutBuilder(builder: (context, constraints) {
              final width = constraints.maxWidth;

              final defaultChild = Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: width * (2 / 9) * 0.12),
                  SizedBox(
                      height: 40,
                      width: 34,
                      child: FittedBox(
                        // fit: BoxFit.fill,
                        child: Image.asset('assets/images/aclogo.png'),
                      )
                      // child: SVG(
                      //     'assets/images/logo_dark.svg',
                      //     width: 40, height: 40,
                      //     semanticsLabel: "Logo"
                      // ),

                      ),
                  if (showName ?? true)
                    const CustomText("Crisp TV Academy",
                        style: TextStyle(
                            color: CustomColors.grey,
                            fontSize: 22,
                            fontWeight: FontWeight.w800)),
                  if (showName ?? true) const SizedBox(width: 10),
                  Expanded(
                      child: SizedBox(
                    child: child ?? const SizedBox.shrink(),
                  )),
                  Builder(builder: (context) {
                    if (!userLoggedIn && showOnboarding) {
                      return Row(
                        children: [
                          SizedBox(
                              width: ResponsiveWidget.isLargeScreen(
                                      maxWidth: width)
                                  ? Dimen.horizontalMarginWidth * 2
                                  : Dimen.horizontalMarginWidth),
                          CustomButton(
                            text: "Sign In",
                            onPressed: () {
                              Get.toNamed(signInRoute);
                            },
                            width: ResponsiveWidget.isSmallScreen()
                                ? width * (2.4 / 9)
                                : ResponsiveWidget.isMediumScreen()
                                    ? width * (1.6 / 9)
                                    : width * (1.2 / 9),
                            height: Constants.screenHeight * 0.06,
                            isOutlined: true,
                          ),
                          const SizedBox(width: 10),
                          CustomButton(
                            text: "Sign Up",
                            onPressed: () {
                              Get.toNamed(signUpRoute);
                            },
                            width: ResponsiveWidget.isSmallScreen()
                                ? width * (2.4 / 9)
                                : ResponsiveWidget.isMediumScreen()
                                    ? width * (1.6 / 9)
                                    : width * (1.2 / 9),
                            height: Constants.screenHeight * 0.06,
                          ),
                        ],
                      );
                    }

                    return const SizedBox();
                  }),
                  SizedBox(width: width * (2 / 9) * 0.12),
                ],
              );

              if (replaceChild) {
                return child ?? defaultChild;
              } else {
                return defaultChild;
              }
            }),
          )
        ],
      ),
    );
  }
}
