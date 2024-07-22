import 'package:cripstv_academy/config/constants.dart';
import 'package:cripstv_academy/core/model/job_details.dart';
import 'package:cripstv_academy/pages/shared/view/animated_image_view.dart';
import 'package:cripstv_academy/pages/shared/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

class TopTalentGrid extends StatelessWidget {
  final double availableWidth;
  final bool isUserEvent;
  final List<TopTalent> topTalents;
  const TopTalentGrid(
      {super.key,
      required this.availableWidth,
      required this.topTalents,
      this.isUserEvent = false});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: ResponsiveWidget.isSmallScreen()
            ? 1
            : ResponsiveWidget.isMediumScreen()
                ? 2
                : 3,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        childAspectRatio: ResponsiveWidget.isSmallScreen()
            ? 1.6
            : ResponsiveWidget.isMediumScreen()
                ? 1.1
                : 1.2,
      ),
      itemCount: topTalents.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return getItem(
            text: "Customize Registration",
            image: "assets/images/landing_one.svg",
            backgroundColor: const Color(0xFFFF826C));
        // return JobDetailsContainer(
        //   jobDetails: jobs[index],
        //   onApplyPressed: () {
        //       Get.toNamed(applicationFormRoute);
        //   },
        // );
      },
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
