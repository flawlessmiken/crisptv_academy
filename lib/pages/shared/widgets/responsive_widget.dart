import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cripstv_academy/config/config.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;
  const ResponsiveWidget({required this.largeScreen, this.mediumScreen, this.smallScreen, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? mediumScreen = this.mediumScreen;
    Widget? smallScreen= this.smallScreen;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (smallScreen != null && mediumScreen == null) {
          mediumScreen = smallScreen;
        }

        if (isLargeScreen()) {
          return largeScreen;
        } else if (isMediumScreen()) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }

  static bool isSmallScreen({double? maxWidth}) {
    final width = maxWidth ?? SizeConfig(Get.context!).deviceWidth;

    return width <= Constants.smallScreenSize;
  }

  static bool isMediumScreen({double? maxWidth}) {
    final width = maxWidth ?? SizeConfig(Get.context!).deviceWidth;

    return width > Constants.smallScreenSize &&
        width <= Constants.mediumScreenSize;
  }

  static bool isLargeScreen({double? maxWidth}) {
    final width = maxWidth ?? SizeConfig(Get.context!).deviceWidth;
    return width > Constants.mediumScreenSize;
  }
}