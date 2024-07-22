import 'package:cripstv_academy/config/colors.dart';
import 'package:cripstv_academy/config/constants.dart';
import 'package:cripstv_academy/config/styles.dart';
import 'package:cripstv_academy/core/session_manager/default.dart';
import 'package:cripstv_academy/logic/models/user.dart';
import 'package:cripstv_academy/pages/shared/widgets/custom_button.dart';
import 'package:cripstv_academy/pages/shared/widgets/custom_text.dart';
import 'package:cripstv_academy/pages/shared/widgets/responsive_widget.dart';
import 'package:cripstv_academy/pages/shared/widgets/svg.dart';
import 'package:cripstv_academy/pages/shared/widgets/user_image_icon.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  final double width;

  const Footer({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = SessionManager.instance.user;

    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;

      return Stack(
        alignment: Alignment.bottomRight,
        children: [
          SizedBox(
            height: Constants.screenHeight * 0.65,
            width: width,
            child: const ArcTopRectangle(),
          ),

          Container(
            padding: EdgeInsets.symmetric(
                horizontal: ResponsiveWidget.isLargeScreen(
                        maxWidth: constraints.maxWidth)
                    ? constraints.maxWidth * .05
                    : ResponsiveWidget.isMediumScreen(
                            maxWidth: constraints.maxWidth)
                        ? constraints.maxWidth * .06
                        : constraints.maxWidth * 0.04),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child:
                            text("Ready to get started?", color: Colors.white)),
                    const Expanded(child: SizedBox()),
                  ],
                ),
                const SizedBox(height: Constants.screenHeight * 0.02),
                CustomButton(
                  text: "Create Event",
                  width: 160,
                  height: Constants.screenHeight * 0.06,
                  color: CustomColors.white,
                  textColor: CustomColors.grey,
                  onPressed: () {},
                ),
                const SizedBox(height: Constants.screenHeight * 0.066),
                ResponsiveWidget(
                  largeScreen: largeScreen,
                  mediumScreen: smallScreen,
                  smallScreen: smallScreen,
                ),
                const SizedBox(height: Constants.screenHeight * 0.06),
              ],
            ),
          ),

          // Builder(
          //   builder: (context) {
          //     double diameter = width * 0.36;

          //     if(diameter > Constants.screenHeight * 0.5) diameter = Constants.screenHeight * 0.5;

          //     return Padding(
          //       padding: EdgeInsets.only(
          //           right: width * 0.08,
          //           bottom: (Constants.screenHeight * 0.5) - (diameter * .5),
          //       ),
          //       child: UserImageIcon(
          //         assetUrl: Constants.peopleImage,
          //         borderWidth: diameter * 0.1,
          //         borderColor: CustomColors.peach[4]!.withOpacity(.12),
          //         radius: diameter,
          //       ),
          //     );
          //   }
          // )
        ],
      );
    });
  }

  Widget text(String value, {Color color = CustomColors.grey}) {
    return ResponsiveWidget(
      largeScreen: baseText(value, 44, color),
      mediumScreen: baseText(value, 38, color),
      smallScreen: baseText(value, 32, color),
    );
  }

  Widget baseText(String value, double fontSize, Color color) {
    return CustomText(
      value,
      style: TextStyle(
          color: color, fontSize: fontSize, fontWeight: FontWeight.w700),
      textAlign: TextAlign.start,
      maxLines: 2,
    );
  }

  Widget get largeScreen {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        kuepass,
        const SizedBox(width: Constants.screenHeight * 0.06 * 0.2),
        const Expanded(child: SizedBox()),
        kuepassText,
        const SizedBox(width: Constants.screenHeight * 0.06 * 0.5),
        socials,
      ],
    );
  }

  Widget get smallScreen {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            kuepass,
            const SizedBox(width: Constants.screenHeight * 0.06 * 0.5),
            Container(
              width: 1,
              height: Constants.screenHeight * 0.05,
              color: CustomColors.white,
            ),
            const SizedBox(width: Constants.screenHeight * 0.06 * 0.2),
            socials,
          ],
        ),
        const SizedBox(height: Constants.screenHeight * 0.02),
        kuepassText,
      ],
    );
  }

  Widget get kuepass {
    return Row(
      children: [
        SizedBox(
          height: 40,
          width: 34,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Image.asset('assets/images/aclogo.png')
          ),
        ),
        const SizedBox(width: 15,),
        const CustomText("Crisp TV Academy",
            style: TextStyle(
                color: CustomColors.white,
                fontSize: 21,
                fontWeight: FontWeight.w800)),
      ],
    );
  }

  Widget get kuepassText {
    return CustomText(
      ("Kuepass. Copyright 2023. All Rights Reserved.").toUpperCase(),
      style: TextStyles(color: CustomColors.white).textBodyLarge,
      textAlign: TextAlign.center,
      maxLines: 3,
    );
  }

  Widget get socials {
    //TODO Change Links
    return Row(
      children: [
        socialItem(
          icon: 'assets/icons/facebook.svg',
          onPressed: () => _launchUrl("https://www.instagram.com/thecrisptvhq"),
        ),
        socialItem(
          icon: 'assets/icons/linked_in.svg',
          onPressed: () => _launchUrl("https://www.instagram.com/thecrisptvhq"),
        ),
        socialItem(
          icon: 'assets/icons/instagram.svg',
          onPressed: () => _launchUrl("https://www.instagram.com/thecrisptvhq"),
        ),
      ],
    );
  }

  Widget socialItem({required String icon, required Function() onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: Constants.screenHeight * 0.06,
        width: Constants.screenHeight * 0.06,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
              color: CustomColors.white.withOpacity(0.25), width: 1.5),
        ),
        padding: const EdgeInsets.all(Constants.screenHeight * 0.06 * 0.15),
        margin:
            const EdgeInsets.only(left: Constants.screenHeight * 0.06 * 0.2),
        child: Center(
          child: SVG(icon,
              height: 18,
              width: 18,
              color: CustomColors.white,
              semanticsLabel: "Icon"),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String actualUrl) async {
    try {
      await launchUrl(Uri.parse(actualUrl),
          mode: LaunchMode.externalNonBrowserApplication);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}

class ArcTopRectangle extends StatelessWidget {
  const ArcTopRectangle({super.key});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 2,
      child: CustomPaint(
        painter: ArcTopRectanglePainter(),
      ),
    );
  }
}

class ArcTopRectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = CustomColors.primary;

    // Draw the rectangular body
    final rect = Rect.fromPoints(
        const Offset(0, 0), Offset(size.width, size.height - 70));
    final rRect = RRect.fromRectAndRadius(rect, const Radius.circular(0));
    canvas.drawRRect(rRect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
// class ArcTopRectanglePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()..color = CustomColors.primary;

//     // Draw the rectangular body
//     final rect =
//     Rect.fromPoints(const Offset(0, 0), Offset(size.width, size.height - 70));
//     final rRect = RRect.fromRectAndRadius(rect, const Radius.circular(0));
//     canvas.drawRRect(rRect, paint);

//     // Draw the arc at the top
//     Path path = Path();
//     path.moveTo(0, size.height - 70);
//     path.lineTo(0, size.height);
//     path.quadraticBezierTo(
//         size.width / 2, size.height + 70, size.width, size.height);
//     path.lineTo(size.width, size.height - 70);
//     path.close();
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }

