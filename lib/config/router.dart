import 'package:cripstv_academy/core/session_manager/default.dart';
import 'package:cripstv_academy/logic/models/user.dart';
import 'package:cripstv_academy/pages/application_screen/application_form.dart';
import 'package:cripstv_academy/pages/dashboard/view/default.dart';
import 'package:cripstv_academy/pages/onboarding/view/default.dart';
import 'package:cripstv_academy/pages/profile_screen/profile_screen.dart';
import 'package:get/get.dart';
import '../pages/home/view/default.dart';
import '../pages/landing_screen/landing_screen.dart';

class CustomRouter {
  static List<GetPage> get pages => [
        GetPage(
            name: landingScreenRoute,
            page: () => LandingScreen(),
            transition: Transition.fadeIn),
        GetPage(
            name: onboardingRoute,
            page: () => const Onboarding(),
            transition: Transition.fadeIn),
        GetPage(
            name: homeRoute,
            page: () => const Home(),
            transition: Transition.fadeIn),
        // GetPage(
        //     name: eventDetailsRoute(":eventId"),
        //     page: () => EventDetails(),
        //     transition: Transition.fadeIn
        // ),
        // GetPage(
        //     name: eventRegistrationRoute(":eventId"),
        //     page: () => EventRegistration(),
        //     transition: Transition.fadeIn
        // ),
        GetPage(
            name: applicationFormRoute,
            page: () => AppliocationFormScreen(),
            transition: Transition.fadeIn),
        // GetPage(
        //     name: subSiteRoute(":eventId"),
        //     page: () => EventSubSite(),
        //     transition: Transition.fadeIn
        // ),
        GetPage(
            name: dashboardRoute,
            page: () => Dashboard(),
            transition: Transition.fadeIn),
        GetPage(
            name: profileRoute,
            page: () => const ProfileScreen(),
            transition: Transition.fadeIn),
        // GetPage(
        //     name: editProfileRoute,
        //     page: () => const EditProfile(),
        //     transition: Transition.fadeIn
        // ),
      ];

  static String overviewRoute(String eventId) => "/dashboard/$eventId/overview";
  static String customizationRoute(String eventId) =>
      "/dashboard/$eventId/customization";
  static String userManagementRoute(String eventId) =>
      "/dashboard/$eventId/user_management";
  static String approvalsRoute(String eventId) =>
      "/dashboard/$eventId/approvals";
  static String financeRoute(String eventId) => "/dashboard/$eventId/finance";
  static String storeRoute(String eventId) => "/dashboard/$eventId/store";
  static String supportRoute(String eventId) => "/dashboard/$eventId/support";

  static Future routeUser([User? u]) async {
    User? user = u;

    if (user == null) {
      Get.toNamed(signInRoute);
      return;
    }

    if (user.emailConfirmed ?? false) {
      final redirect = SessionManager.instance.currentRedirect;
      if (redirect != null && !redirect.contains("/onboarding")) {
        await SessionManager.instance.clearRedirect();
        Get.offAllNamed(redirect);
      } else {
        Get.offAllNamed(homeRoute);
      }
      return;
    } else {
      Get.toNamed(verificationRoute);
      return;
    }
  }
}

const landingScreenRoute = "/";
const homeRoute = "/home";

const dashboardRoute = "/dashboard";
const onboardingRoute = "/onboarding/:pageName";
const signInRoute = "/onboarding/sign_in";
const talentSignInRoute = "/onboarding/talent_sign_in";
const signUpAsRoute = "/onboarding/sign_up_as";
const signInAsRoute = "/onboarding/sign_in_as";
const talentSignUpRoute = "/onboarding/talent_sign_up";

const signUpRoute = "/onboarding/sign_up";
const setUpProfileRoute = "/onboarding/set_up_profile";
const verificationRoute = "/onboarding/verify_email";
const resetPasswordRoute = "/onboarding/reset_password";
const verifyPasswordReset = "/onboarding/verify_password_reset";

const applicationFormRoute = "/application_form";
String eventDetailsRoute(String eventId) => "/event_details/$eventId";

String eventRegistrationRoute(String eventId) => "/register/$eventId";
String subSiteRoute(String eventId) => "/site/$eventId";

String paymentSuccess(String ref) => "/payment_success/$ref";

const profileRoute = "/profile";
const editProfileRoute = "/edit_profile";
