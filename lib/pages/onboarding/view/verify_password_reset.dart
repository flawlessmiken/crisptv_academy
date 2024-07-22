import 'package:cripstv_academy/core/repositories/account_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import 'package:cripstv_academy/app.dart';
import 'package:cripstv_academy/config/config.dart';
import 'package:cripstv_academy/core/core.dart';
import 'package:cripstv_academy/pages/shared/shared.dart';

class VerifyPasswordReset extends HookWidget {
  const VerifyPasswordReset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final otp = useTextEditingController();

    final model = Provider.of<AccountRepository>(context);

    const verticalMargin = Constants.screenHeight * 0.02;

    return Form(
      key: formKey,
      child: Column(children: [
        SizedBox(
            height: ResponsiveWidget.isSmallScreen()
                ? verticalMargin
                : verticalMargin * 2),
        text("Verify Email"),
        const SizedBox(height: verticalMargin * .25),
        CustomText(
          "Kindly provide the 4-digit code that was sent to your email for verification.",
          maxLines: 2,
          style: TextStyles(color: CustomColors.grey).textBodyLarge,
        ),
        const SizedBox(height: verticalMargin * 2),
        Pinput(
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          submittedPinTheme: submittedPinTheme,
          controller: otp,
          validator: (s) {
            if (s != null && s.length > 3) return null;

            return 'OTP must be 4-digit';
          },
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: true,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
          ],
          onCompleted: (pin) => {},
        ),
        const SizedBox(height: verticalMargin),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              App.startLoading();
              // await model.passwordResetOtp({
              //   "email": "user@example.com",
              //   "password": "string",
              //   "confirmPassword": "string",
              //   "otp": "string"
              // });
              App.stopLoading();
            },
            child: RichText(
              text: TextSpan(
                children: <InlineSpan>[
                  WidgetSpan(
                      child: CustomText(
                    "Didn't get the code? ",
                    textAlign: TextAlign.center,
                    style: TextStyles(
                      color: CustomColors.grey[5],
                    ).textBodyLarge,
                  )),
                  WidgetSpan(
                      child: CustomText(
                    "Resend OTP ",
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
        const SizedBox(height: verticalMargin * 2),
        LayoutBuilder(builder: (context, constraints) {
          final width = constraints.maxWidth;
          return CustomButton(
            text: "Verify Email",
            isOutlined: false,
            onPressed: () async {
              if (!formKey.currentState!.validate()) return;

              App.startLoading();
              // final success = await model.passwordReset(otp: otp.text);
              await model.passwordResetOtp({
                "email": "user@example.com",
                "password": "string",
                "confirmPassword": "string",
                "otp": "string"
              });

              App.stopLoading();

              // if (success) Get.toNamed(signInRoute);
            },
            color: CustomColors.grey[0],
            width: ResponsiveWidget.isSmallScreen() ? width * .9 : width * .7,
            height: Constants.screenHeight * 0.06,
          );
        }),
      ]),
    );
  }

  Widget text(String value, {Color color = CustomColors.grey}) {
    return ResponsiveWidget(
      largeScreen: baseText(value, 50, color),
      mediumScreen: baseText(value, 46, color),
      smallScreen: baseText(value, 36, color),
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
