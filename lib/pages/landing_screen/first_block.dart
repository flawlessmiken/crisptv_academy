
import 'package:cripstv_academy/config/colors.dart';
import 'package:cripstv_academy/config/constants.dart';
import 'package:cripstv_academy/config/dimen.dart';
import 'package:cripstv_academy/core/session_manager/default.dart';
import 'package:cripstv_academy/logic/models/user.dart';
import 'package:cripstv_academy/pages/shared/widgets/custom_text.dart';
import 'package:cripstv_academy/pages/shared/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

class FirstBlock extends StatefulWidget {
  const FirstBlock({super.key});

  @override
  State<FirstBlock> createState() => _FirstBlockState();
}

class _FirstBlockState extends State<FirstBlock> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: largeScreen(),
      mediumScreen: const _MainBody(),
      smallScreen: const _MainBody(),
    );
  }

  Widget largeScreen() {
    return Row(
      children: [
        const Expanded(flex: 5, child: _MainBody()),

          const Expanded(flex: 1, child: SizedBox()),

        Expanded(
          flex: 5,
          child: LayoutBuilder(builder: (context, constraints) {
            final width = constraints.maxWidth;

            return SizedBox(
              height: Constants.screenHeight * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: Constants.screenHeight * 0.04,
                  ),
                  Expanded(
                    child: Container(
                      height: Constants.screenHeight * 0.4,
                      width: width * 0.9,
                      decoration: const BoxDecoration(
                      
                        image: DecorationImage(
                          image: AssetImage('assets/images/image.png'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),

                      margin:  EdgeInsets.only(right: width *.09),
                     
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _MainBody extends StatefulWidget {
  const _MainBody();

  @override
  State<_MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<_MainBody>
    with SingleTickerProviderStateMixin {
  late AnimationController sizeController;
  late Animation<double> sizeAnimation;


  final pageController = PageController();

  

  User? user = SessionManager.instance.user;

  @override
  void initState() {
   

    sizeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    sizeAnimation = Tween<double>(
      begin: 1,
      end: 1.3,
    ).animate(
        CurvedAnimation(parent: sizeController, curve: Curves.elasticOut));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  
    });

    super.initState();
  }

  @override
  void dispose() {
    sizeController.dispose();
    pageController.dispose();
  
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final verticalMargin = Dimen.verticalMarginHeight * 1.5;
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal:
                ResponsiveWidget.isLargeScreen(maxWidth: constraints.maxWidth)
                    ? constraints.maxWidth * .1
                    : ResponsiveWidget.isMediumScreen(
                            maxWidth: constraints.maxWidth)
                        ? constraints.maxWidth * .06
                        : constraints.maxWidth * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: text("Online Talent Sourcing"))),
              ],
            ),
            SizedBox(height: verticalMargin * .05),
            Builder(builder: (context) {
              if (!ResponsiveWidget.isSmallScreen()) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    text("MADE EASY!", color: CustomColors.primary),
                  ],
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text("MADE EASY!", color: CustomColors.primary),
                  ],
                );
              }
            }),
            SizedBox(height: verticalMargin * 0.75),
            const CustomText(
              "The platform that connects clients to the best talents  "
              "for their projects and also give tech talents opportunity to sell what they have to offer",
              style: TextStyle(
                  color: Color(0xFF667085),
                  fontWeight: FontWeight.w400,
                  fontSize: 21),
              maxLines: 10,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: verticalMargin * 0.75),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      '+200',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 21),
                    ),
                    SizedBox(height: 2.0),
                    CustomText(
                      'Talents',
                      style: TextStyle(
                          color: Color(0xFF667085),
                          fontWeight: FontWeight.w300,
                          fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: VerticalDivider(
                    color: Colors.grey,
                    thickness: 1.0,
                    width: 20.0,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      '+200',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 21),
                    ),
                    SizedBox(height: 2.0),
                    CustomText(
                      'Recruiters',
                      style: TextStyle(
                          color: Color(0xFF667085),
                          fontWeight: FontWeight.w300,
                          fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: VerticalDivider(
                    color: Colors.grey,
                    thickness: 1.0,
                    width: 20.0,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      '+1000',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 21),
                    ),
                    SizedBox(height: 2.0),
                    CustomText(
                      'Projects',
                      style: TextStyle(
                          color: Color(0xFF667085),
                          fontWeight: FontWeight.w300,
                          fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: verticalMargin * 1.5),
          ],
        ),
      );
    });
  }

  Widget text(String value, {Color color = CustomColors.grey}) {
    return ResponsiveWidget(
      largeScreen: baseText(value, 54, color),
      mediumScreen: baseText(value, 48, color),
      smallScreen: baseText(value, 42, color),
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

  Widget get discover => text("Discover");

  Widget get create => text("Create");
}
