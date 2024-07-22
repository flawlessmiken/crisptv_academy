import 'package:cripstv_academy/pages/shared/widgets/user_card.dart';
import 'package:flutter/material.dart';

import 'package:cripstv_academy/app.dart';
import 'package:cripstv_academy/config/config.dart';
import 'package:cripstv_academy/pages/shared/shared.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final availableWidth = constraints.maxWidth;

      const verticalMargin = Constants.screenHeight * 0.07;

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
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: availableWidth * .05,
                            right: availableWidth * .02),
                        child: Column(
                          children: [
                            const SizedBox(height: verticalMargin),
                            UserCardWidget(),
                          ],
                        ),
                      )),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: availableWidth * 0.85,
                    height: double.infinity,
                    padding: EdgeInsets.only(
                      left: (availableWidth * 0.15) -
                          40 -
                          Dimen.horizontalMarginWidth,
                      right: availableWidth * 0.15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: verticalMargin),
                        SizedBox(
                          width: 100,
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Row(
                                children: [
                                  const RotatedBox(
                                      quarterTurns: 1,
                                      child: SVG('assets/icons/arrow_i.svg',
                                          height: 24,
                                          width: 24,
                                          color: CustomColors.grey,
                                          semanticsLabel: "Back")),
                                  CustomText(
                                    "Back",
                                    style: TextStyles(
                                      color: CustomColors.grey,
                                    ).textTitleLarge,
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: verticalMargin),
                        Row(
                          children: [
                            const CircleAvatar(
                              // Add your avatar image here
                              radius: 50,
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  "Fred Will",
                                  style: TextStyles(
                                    color: CustomColors.grey,
                                  ).textTitleLarge,
                                  textAlign: TextAlign.start,
                                ),
                                CustomText(
                                  "CEO Wellas Inst.",
                                  style: TextStyles(
                                    color: CustomColors.grey,
                                  ).textTitleLarge,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  "Email Address: sarah@gmail.com",
                                  style: TextStyles(
                                    color: CustomColors.grey,
                                  ).textTitleLarge,
                                  textAlign: TextAlign.start,
                                ),
                                CustomText(
                                  "Phone Number: +234 8176 068414",
                                  style: TextStyles(
                                    color: CustomColors.grey,
                                  ).textTitleLarge,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: verticalMargin),
                        CustomText(
                          "We are looking for a skilled designer "
                          "to work on an e-commerce website. The project is to serve for a "
                          "duration of 3 weeks, You wil be responsible for carrying out thorough "
                          "research to get a clear picture of who you are designing for. "
                          "You will also be working directly with the development teams in this projects.",
                          style: TextStyles(
                            color: CustomColors.grey,
                          ).textTitleLarge,
                          maxLines: 7,
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: verticalMargin),
                        CustomText(
                          "ome of the Specific Requirements Include:",
                          style: TextStyles(
                            color: CustomColors.grey,
                          ).textTitleLarge,
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: verticalMargin),
                        CustomText(
                          "* Carry out research\n"
                          "* Come up with Persona’s\n"
                          "* Create User fow\n"
                          "* Design low-fidelity\n"
                          "* Design High Fidelity\n"
                          "* Prototype\n",

                          style: TextStyles(
                            color: CustomColors.grey,
                          ).textTitleLarge,
                          maxLines: 13,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
