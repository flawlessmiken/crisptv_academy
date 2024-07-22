import 'dart:math';

import 'package:cripstv_academy/pages/shared/widgets/custom_text.dart';
import 'package:cripstv_academy/providers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'config/config.dart';
import 'controllers/controllers.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();

  static void startLoading() => Get.find<UserController>().startLoading();

  static void stopLoading() => Get.find<UserController>().stopLoading();

  static double get screenHeight {
    if(Constants.screenHeight.toDouble() < Dimen.height){
      return Dimen.height;
    } else {
      return Constants.screenHeight.toDouble();
    }
  }

  static String generateUsername(String name) {
    final names = name.split(" ");

    Random random = Random();
    String code = "";
    for (int i = 0; i < 3; i++) {
      code += random.nextInt(9).toString();
    }

    String username = names[0].toLowerCase() + code;

    return username;
  }

  static String fillCommas(String input) {
    String output = "";
    String suffix = "";

    if (input.length > 2) {
      final lastDigits = input.substring(input.length - 2);
      if (lastDigits.substring(0, 1) == ".") {
        suffix = input.substring(input.length - 2);
        input = input.substring(0, input.length - 2);
      }
    }

    if (input.length > 3) {
      final lastDigits = input.substring(input.length - 3);
      if (lastDigits.substring(0, 1) == ".") {
        suffix = input.substring(input.length - 3);
        input = input.substring(0, input.length - 3);
      }
    }

    if (input.trim().length <= 3) return input;
    int counter = 0;

    for (int i = input.length; i > 0; i--) {
      String char = input[i -1];

      output = char + output;

      counter++;

      if(counter % 3 == 0 && i > 1){
        output = ',$output';
        counter = 0;
      }
    }
    return output + suffix;
  }
}


class _AppState extends State<App> {

  @override
  void initState() {
    Get.put(UserController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CustomText.referenceSize = Constants.largeScreenSize;

    return MultiProvider(
      // holds all instances of providers that would be used for this application
      providers: AppProviders.providers,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: "DMSans",
            primaryColor: CustomColors.primary,
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: CustomColors.primary,
              selectionColor: CustomColors.primary[2],
              selectionHandleColor: CustomColors.primary,
            ),
            scrollbarTheme: ScrollbarThemeData(
              // thumbVisibility: MaterialStateProperty.all<bool>(true),
              thickness: MaterialStateProperty.all<double>(4),
              radius: const Radius.circular(4),
            )
        ),
        title: "Crisp TV Academy",
        scrollBehavior: CustomScrollBehavior(),
        initialRoute: landingScreenRoute,
        getPages: CustomRouter.pages,
        locale: const Locale('en', ''),
      ),
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

