// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';

// import 'package:cripstv_academy/app.dart';

// import 'package:cripstv_academy/core/core.dart';
// import 'package:cripstv_academy/logic/models/models.dart';
// import 'package:cripstv_academy/config/config.dart';
// import 'package:cripstv_academy/pages/shared/shared.dart';

// class TalentSignUP extends HookWidget {
//   const TalentSignUP({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

//     final signUpKey = GlobalKey<FormState>();

//     final model = Provider.of<AuthRepository>(context);

//     final name = useTextEditingController();
//     final email = useTextEditingController();
//     final password = useTextEditingController();

//     const verticalMargin = Constants.screenHeight * 0.02;

//     return Form(
//       key: signUpKey,
//       child: Column(children: [

//         SizedBox(height: ResponsiveWidget.isSmallScreen() ? verticalMargin : verticalMargin * 2),

//         text("Welcome!"),

//         const SizedBox(height: verticalMargin * .25),

//         CustomText(
//           "Can’t wait to to show you the happening events around you.",
//           maxLines: 2,
//           style: TextStyles(color: CustomColors.grey).textBodyExtraLarge,
//         ),

//         const SizedBox(height: verticalMargin * 2),

//         BoxTextField(
//           controller: name,
//           label: "Name",
//           hint: "Enter your name",
//           suffix: const Icon(
//             Icons.person_2_outlined,
//             color: CustomColors.grey,
//           ),
//           textInputType: TextInputType.emailAddress,
//           validator: (value) {
//             if(value != null){
//               if(value.trim().length < 2){
//                 return "Please input a valid name";
//               } else {
//                 return null;
//               }
//             } else {
//               return "Please input a valid email address";
//             }
//           },
//         ),

//         const SizedBox(height: verticalMargin),

//         BoxTextField(
//           controller: email,
//           label: "Email address",
//           hint: "Enter your email",
//           suffix: const Icon(
//             Icons.email_outlined,
//             color: CustomColors.grey,
//           ),
//           textInputType: TextInputType.emailAddress,
//           validator: (value) {
//             if(value != null){
//               if(value.trim().isEmpty) {
//                 return "Please input a valid email address";
//               }else {
//                 if (!value.trim().isEmail) {
//                   return "Please input a valid email address";
//                 }
//               }
//             } else {
//               return "Please input a valid email address";
//             }

//             return null;
//           },
//         ),

//         const SizedBox(height: verticalMargin),

//         BoxTextField(
//           controller: password,
//           label: "Password",
//           hint: "Enter your password",
//           obscureText: true,
//           textInputType: TextInputType.text,
//           validator: (value) {
//             if(value != null) {
//               if (value.length < 8) {
//                 return "Password should be at least 8 characters long";
//               }
//             } else {
//               return "Password should be at least 8 characters long";
//             }
//             return null;
//           },
//         ),

//         const SizedBox(height: verticalMargin * 2),

//         LayoutBuilder(builder: (context, constraints) {
//           final width = constraints.maxWidth;
//           return CustomButton(
//             text: "Sign Up",
//             width: ResponsiveWidget.isSmallScreen() ? width * .9 : width * .7,
//             height: Constants.screenHeight * 0.06,
//             onPressed: () async {
//               // if (!signUpKey.currentState!.validate()) return;

//               // App.startLoading();

//               // final result = await model.signUp(
//               //   fullName: name.text.trim(),
//               //   email: email.text.trim(),
//               //   phoneNumber: 'nil',
//               //   userName: App.generateUsername(name.text.trim()),
//               //   password: password.text,
//               // );

//               // App.stopLoading();

//               // if(!result) return;

//               // final user = User(
//               //   id: "",
//               //   email: email.text.trim()
//               // );

//               // App.startLoading();
//               // await SessionManager.instance.setUserData(user);
//               // App.stopLoading();

//               Get.toNamed(setUpProfileRoute);
//             },
//           );
//         }),

//         const SizedBox(height: verticalMargin),

//         Material(
//           color: Colors.transparent,
//           child: InkWell(
//             onTap: () {
//               Get.toNamed(signInRoute);
//             },
//             child: RichText(
//               text: TextSpan(
//                 children: <InlineSpan>[
//                   WidgetSpan(
//                       child: CustomText(
//                         "  Already have an account? ",
//                         textAlign: TextAlign.center,
//                         style: TextStyles(
//                           color: CustomColors.grey[5],
//                         ).textBodyLarge,
//                       )),
//                   WidgetSpan(
//                       child: CustomText(
//                         "Sign In  ",
//                         textAlign: TextAlign.center,
//                         style: TextStyles(
//                           color: CustomColors.primary,
//                         ).textBodyLarge,
//                       )),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ]),
//     );
//   }

//   Widget text (String value, {Color color = CustomColors.grey}){
//     return ResponsiveWidget(
//       largeScreen: baseText(value, 50, color),
//       mediumScreen: baseText(value,  42, color),
//       smallScreen: baseText(value, 32, color),
//     );
//   }

//   Widget baseText (String value, double fontSize, Color color){
//     return CustomText(
//       value,
//       style: TextStyle(
//           color: color,
//           fontSize: fontSize,
//           fontWeight: FontWeight.w700
//       ),
//       textAlign: TextAlign.center,
//       maxLines: 2,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:cripstv_academy/app.dart';
import 'package:cripstv_academy/core/core.dart';
import 'package:cripstv_academy/logic/models/models.dart';
import 'package:cripstv_academy/config/config.dart';
import 'package:cripstv_academy/pages/shared/shared.dart';

class TalentSignUP extends HookWidget {
  const TalentSignUP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signUpKey = GlobalKey<FormState>();

    final model = Provider.of<AuthRepository>(context);

    final name = useTextEditingController();
    final email = useTextEditingController();
    final password = useTextEditingController();

    const verticalMargin = Constants.screenHeight * 0.02;

    return Form(
      key: signUpKey,
      child: Column(children: [
        SizedBox(
            height: ResponsiveWidget.isSmallScreen()
                ? verticalMargin
                : verticalMargin * 2),
        text("Welcome!"),
        const SizedBox(height: verticalMargin * .25),
        CustomText(
          "Can’t wait to show you the happening events around you.",
          maxLines: 2,
          style: TextStyles(color: CustomColors.grey).textBodyExtraLarge,
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
        const SizedBox(height: verticalMargin * 2),
        LayoutBuilder(builder: (context, constraints) {
          final width = constraints.maxWidth;
          return CustomButton(
            text: "Sign Up",
            width: ResponsiveWidget.isSmallScreen() ? width * .9 : width * .7,
            height: Constants.screenHeight * 0.06,
            onPressed: () async {
              // if (!signUpKey.currentState!.validate()) return;

              // App.startLoading();

              // final result = await model.signUpTalent({
              //   'fullName': name.text.trim(),
              //   'email': email.text.trim(),
              //   'password': password.text,
              // });

              // App.stopLoading();

              // if (!(result.isSuccessful ?? false)) {
              //   Snack.show(
              //     message: result.message ?? "An Error Occurred",
              //     type: SnackBarType.error,
              //   );
              //   return;
              // }

              // final user = User(
              //   id: result.data['id'],
              //   email: email.text.trim(),
              // );

              // App.startLoading();
              // await SessionManager.instance.setUserData(user);
              // App.stopLoading();

              // Get.toNamed(setUpProfileRoute);

              if (!signUpKey.currentState!.validate()) return;

              App.startLoading();

              final result = await model.signInTalent({
                'name': name.text.trim(),
                'email': email.text.trim(),
                'userName': email.text.trim(),
                'password': password.text,
              });

              App.stopLoading();

              if (!(result?.isSuccessful ?? false)) {
                Snack.show(
                  message: result?.message ?? "An Error Occurred",
                  type: SnackBarType.error,
                );

                return;
              }

              try {
                App.startLoading();
                await SessionManager.instance.setEmail(email.text.trim());
                App.stopLoading();

                Get.toNamed(verificationRoute);
              } catch (e) {
                print(e);
                App.stopLoading();
              }
            },
          );
        }),
        const SizedBox(height: verticalMargin),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Get.toNamed(signInAsRoute);
            },
            child: RichText(
              text: TextSpan(
                children: <InlineSpan>[
                  WidgetSpan(
                    child: CustomText(
                      "  Already have an account? ",
                      textAlign: TextAlign.center,
                      style: TextStyles(
                        color: CustomColors.grey[5],
                      ).textBodyLarge,
                    ),
                  ),
                  WidgetSpan(
                    child: CustomText(
                      "Sign In  ",
                      textAlign: TextAlign.center,
                      style: TextStyles(
                        color: CustomColors.primary,
                      ).textBodyLarge,
                    ),
                  ),
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
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
      ),
      textAlign: TextAlign.center,
      maxLines: 2,
    );
  }
}
