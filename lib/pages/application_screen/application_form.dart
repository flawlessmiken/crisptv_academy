import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:cripstv_academy/core/core.dart';
import 'package:cripstv_academy/config/config.dart';
import 'package:cripstv_academy/pages/shared/shared.dart';

class AppliocationFormScreen extends HookWidget {
  const AppliocationFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signUpKey = GlobalKey<FormState>();

    final model = Provider.of<AuthRepository>(context);

    final name = useTextEditingController();
    final email = useTextEditingController();
    final phone = useTextEditingController();
    final coverLetter = useTextEditingController();
    final expectedPay = useTextEditingController();

    const verticalMargin = Constants.screenHeight * 0.02;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          final width = constraints.maxWidth;
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveWidget.isLargeScreen()
                  ? width * 0.19
                  : ResponsiveWidget.isMediumScreen()
                      ? width * 0.16
                      : width * 0.12,
            ),
            child: Form(
              key: signUpKey,
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                      height: ResponsiveWidget.isSmallScreen()
                          ? verticalMargin
                          : verticalMargin * 2),
                  text("Application Form"),
                  const SizedBox(height: verticalMargin * .25),
                  CustomText(
                    "You are so close to getting a chance at your dream role!",
                    maxLines: 2,
                    style:
                        TextStyles(color: CustomColors.grey).textBodyExtraLarge,
                  ),
                  const SizedBox(height: verticalMargin * 2),
                  BoxTextField(
                    controller: name,
                    label: "Name",
                    hint: "Enter your name",
                    suffix: const Icon(
                      Icons.person_2_outlined,
                      color: CustomColors.grey,
                    ),
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value != null) {
                        if (value.trim().length < 2) {
                          return "Please input a valid name";
                        } else {
                          return null;
                        }
                      } else {
                        return "Please input a valid email address";
                      }
                    },
                  ),
                  const SizedBox(height: verticalMargin),
                  BoxTextField(
                    controller: email,
                    label: "Email address",
                    hint: "Enter your email",
                    suffix: const Icon(
                      Icons.email_outlined,
                      color: CustomColors.grey,
                    ),
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value != null) {
                        if (value.trim().isEmpty) {
                          return "Please input a valid email address";
                        } else {
                          if (!value.trim().isEmail) {
                            return "Please input a valid email address";
                          }
                        }
                      } else {
                        return "Please input a valid email address";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: verticalMargin),
                  BoxTextField(
                    controller: phone,
                    label: "Phone",
                    hint: "Enter your Phone Number",
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: verticalMargin),
                  BoxTextField(
                    controller: coverLetter,
                    label: "Cover Letter",
                    hint:
                        "Write a cover letter or something you would like to tell th team.",
                    maxLength: 5,
                    maxLines: 5,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: verticalMargin),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: Constants.screenHeight * .15,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: CustomColors.grey[4]!.withOpacity(0.5)),
                          ),
                          child: const Center(child: Text('Upload CV')),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: verticalMargin),
                  BoxTextField(
                    controller: expectedPay,
                    label: "Expected Pay",
                    hint: "\$50,000,00:00",
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: verticalMargin * 2),
                  LayoutBuilder(builder: (context, constraints) {
                    final width = constraints.maxWidth;
                    return CustomButton(
                      text: "Save",
                      width: ResponsiveWidget.isSmallScreen()
                          ? width * .9
                          : width * .7,
                      height: Constants.screenHeight * 0.06,
                      onPressed: () async {
                        Get.toNamed(homeRoute);
                      },
                    );
                  }),
                  const SizedBox(height: verticalMargin),
                ]),
              ),
            ),
          );
        }),
      ),
    );
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
