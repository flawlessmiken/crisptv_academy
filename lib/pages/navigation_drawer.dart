import 'package:cripstv_academy/config/colors.dart';
import 'package:cripstv_academy/config/constants.dart';
import 'package:cripstv_academy/config/size_config.dart';
import 'package:cripstv_academy/controllers/default_controller.dart';
import 'package:cripstv_academy/pages/shared/widgets/navigation_item.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:cripstv_academy/config/router.dart' as router;

class NavigationDrawer extends StatelessWidget {
  final bool isFull;
  const NavigationDrawer({Key? key, required this.isFull}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DefaultController>();

    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        width: double.infinity,
        height: SizeConfig(context).deviceHeight,
        decoration: BoxDecoration(
            color: CustomColors.white,
            borderRadius:
                const BorderRadius.only(bottomRight: Radius.circular(12)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: const Offset(2, 4),
                  blurRadius: 50,
                  color: CustomColors.grey.withOpacity(0.25))
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: Constants.screenHeight * 0.05),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NavigationItem(
                        iconPath: 'assets/icons/overview.svg',
                        title: "Overview",
                        onPressed: () =>
                            _navigateToAction(context, controller, 0, isFull)),
                    NavigationItem(
                        iconPath: 'assets/icons/customization.svg',
                        title: "Customization",
                        onPressed: () =>
                            _navigateToAction(context, controller, 1, isFull)),
                    NavigationItem(
                        iconPath: 'assets/icons/user_management.svg',
                        title: "User Management",
                        onPressed: () =>
                            _navigateToAction(context, controller, 2, isFull)),
                    NavigationItem(
                        iconPath: 'assets/icons/finance.svg',
                        title: "Finance",
                        onPressed: () =>
                            _navigateToAction(context, controller, 3, isFull)),
                    NavigationItem(
                        iconPath: 'assets/icons/store.svg',
                        title: "Store",
                        onPressed: () =>
                            _navigateToAction(context, controller, 4, isFull)),
                    NavigationItem(
                        iconPath: 'assets/icons/support.svg',
                        title: "Support",
                        onPressed: () =>
                            _navigateToAction(context, controller, 5, isFull)),
                    const SizedBox(height: 70),
                    NavigationItem(
                        iconPath: 'assets/icons/logout.svg',
                        title: "Logout",
                        onPressed: () =>
                            _navigateToAction(context, controller, 6, isFull)),
                    const SizedBox(height: 6),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToAction(BuildContext context, DefaultController controller,
      int index, bool isFull) async {
    final fields = Get.currentRoute.split('/');

    final eventID = fields.length > 2 ? fields[fields.length - 2] : "";
    switch (index) {
      case 0:
        Get.toNamed(router.CustomRouter.overviewRoute(eventID));
        break;
      case 1:
        Get.toNamed(router.CustomRouter.customizationRoute(eventID));
        break;
      case 2:
        Get.toNamed(router.CustomRouter.userManagementRoute(eventID));
        break;
      case 3:
        Get.toNamed(router.CustomRouter.financeRoute(eventID));
        break;
      case 4:
        Get.toNamed(router.CustomRouter.storeRoute(eventID));
        break;
      case 5:
        Get.toNamed(router.CustomRouter.supportRoute(eventID));
        break;
      case 6:
       
        // Get.toNamed(signInRoute);
        break;
    }

    if (!isFull) Get.find<DefaultController>().closeDrawer();
  }
}
