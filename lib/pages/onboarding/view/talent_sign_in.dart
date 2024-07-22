import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:cripstv_academy/app.dart';

import 'package:cripstv_academy/core/core.dart';
import 'package:cripstv_academy/config/config.dart';
import 'package:cripstv_academy/pages/shared/shared.dart';

class TalentSignIn extends HookWidget {
  const TalentSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginKey = GlobalKey<FormState>();

    final model = Provider.of<AuthRepository>(context);

    final password = useTextEditingController();
    final email = useTextEditingController();

    const verticalMargin = Constants.screenHeight * 0.02;

    return Form(
      key: loginKey,
      child: Column(children: [
        SizedBox(
            height: ResponsiveWidget.isSmallScreen()
                ? verticalMargin
                : verticalMargin * 2),
        text("Welcome Back!"),
        const SizedBox(height: verticalMargin * .25),
        CustomText(
          "We are so glad to have you kickoff from where you stopped.",
          maxLines: 2,
          style: TextStyles(color: CustomColors.grey).textBodyLarge,
        ),
        const SizedBox(height: verticalMargin * 2),
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
          controller: password,
          label: "Password",
          hint: "Enter your password",
          obscureText: true,
          textInputType: TextInputType.text,
          validator: (value) {
            if (value != null) {
              if (value.length < 8) {
                return "Password should be at least 8 characters long";
              }
            } else {
              return "Password should be at least 8 characters long";
            }
            return null;
          },
        ),
        const SizedBox(height: verticalMargin),
        Align(
          alignment: Alignment.centerRight,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Get.toNamed(resetPasswordRoute);
              },
              child: CustomText(
                "Forgot Password?",
                textAlign: TextAlign.center,
                style: TextStyles(
                  color: CustomColors.primary,
                ).textBodyLarge,
              ),
            ),
          ),
        ),
        const SizedBox(height: verticalMargin * 3),
        LayoutBuilder(builder: (context, constraints) {
          final width = constraints.maxWidth;
          return CustomButton(
            text: "Sign In",
            width: ResponsiveWidget.isSmallScreen() ? width * .9 : width * .7,
            height: Constants.screenHeight * 0.06,
            onPressed: () async {
              if (!loginKey.currentState!.validate()) return;

              App.startLoading();
              await model.signInTalent({
                "email": email.text,
                "password": password.text,
              });
              App.stopLoading();
            },
          );
        }),
        const SizedBox(height: verticalMargin),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Get.toNamed(signUpAsRoute);
            },
            child: RichText(
              text: TextSpan(
                children: <InlineSpan>[
                  WidgetSpan(
                      child: CustomText(
                    " Don't have an account? ",
                    textAlign: TextAlign.center,
                    style: TextStyles(
                      color: CustomColors.grey[5],
                    ).textBodyLarge,
                  )),
                  WidgetSpan(
                      child: CustomText(
                    "Sign Up ",
                    textAlign: TextAlign.center,
                    style: TextStyles(
                      color: CustomColors.primary,
                    ).textBodyLarge,
                  )),
                ],
              ),
            ),
          ),
        ),
      ]),
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
