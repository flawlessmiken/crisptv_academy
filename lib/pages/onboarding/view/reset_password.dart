import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:cripstv_academy/app.dart';
import 'package:cripstv_academy/config/config.dart';
import 'package:cripstv_academy/core/core.dart';
import 'package:cripstv_academy/pages/shared/shared.dart';

class ResetPassword extends HookWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();

    final model = Provider.of<AuthRepository>(context);

    final email = useTextEditingController();
    final password = useTextEditingController();

    const verticalMargin = Constants.screenHeight * 0.02;

    return Form(
      key: formKey,
      child: Column(
        children: [

          SizedBox(height: ResponsiveWidget.isSmallScreen() ? verticalMargin : verticalMargin * 2),

          text("Reset Password"),

          const SizedBox(height: verticalMargin * .25),

          CustomText(
            "Kindly input your functional email and we will send you an OTP to help you proceed.",
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
              if(value != null){
                if(value.trim().isEmpty) {
                  return "Please input a valid email address";
                }else {
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
            label: "New Password",
            hint: "Enter your new password",
            obscureText: true,
            textInputType: TextInputType.text,
            validator: (value) {
              if(value != null) {
                if (value.length < 8) {
                  return "Password should be at least 8 characters long";
                }
              } else {
                return "Password should be at least 8 characters long";
              }
              return null;
            },
          ),

          const SizedBox(height: verticalMargin * 3),

          LayoutBuilder(builder: (context, constraints) {
            final width = constraints.maxWidth;
            return CustomButton(
              text: "Reset",
              width: ResponsiveWidget.isSmallScreen() ? width * .9 : width * .7,
              height: Constants.screenHeight * 0.06,
              onPressed: () async {
                if (!formKey.currentState!.validate()) return;

                // App.startLoading();

                // // var success = await model.passwordReset(
                // //   email: email.text,
                // //   newPassword: password.text,
                // // );

                // App.stopLoading();

                // if(success) Get.toNamed(verifyPasswordReset);
              },
            );
          }),
        ]
      ),
    );
  }

  Widget text (String value, {Color color = CustomColors.grey}){
    return ResponsiveWidget(
      largeScreen: baseText(value, 50, color),
      mediumScreen: baseText(value,  46, color),
      smallScreen: baseText(value, 36, color),
    );
  }

  Widget baseText (String value, double fontSize, Color color){
    return CustomText(
      value,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w700
      ),
      textAlign: TextAlign.center,
      maxLines: 2,
    );
  }
}
