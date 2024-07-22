import 'package:cripstv_academy/config/colors.dart';
import 'package:cripstv_academy/config/constants.dart';
import 'package:cripstv_academy/controllers/default_controller.dart';
import 'package:cripstv_academy/core/session_manager/default.dart';
import 'package:cripstv_academy/logic/models/user.dart';
import 'package:cripstv_academy/pages/shared/view/redirect.dart';
import 'package:cripstv_academy/pages/shared/widgets/glassmorphic_app_bar.dart';
import 'package:cripstv_academy/pages/shared/widgets/loading_wrapper.dart';
import 'package:cripstv_academy/pages/shared/widgets/responsive_widget.dart';
import 'package:cripstv_academy/pages/shared/widgets/svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:cripstv_academy/pages/navigation_drawer.dart' as navigation;



// ignore: must_be_immutable
class Dashboard extends StatefulWidget {
  Dashboard({super.key}) {
    Get.put(DefaultController());
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final pages = [
    "overview",
    "customization",
    "user_management",
    "approvals",
    "finance",
    "store",
    "support",
  ];

  final screenNames = [
    'Overview',
    'Customization',
    'User Management',
    'Approvals',
    'Finance',
    'Store',
    'Support'
  ];

  final controller = Get.find<DefaultController>();

  String eventID = "";

  @override
  void initState() {
    eventID = Get.currentRoute.split("/").last;

    controller.showDrawer.listen((showDrawer) {
      if (showDrawer) {
        widget.scaffoldKey.currentState?.openDrawer();
        controller.showDrawer.value = false;
      }
    });

    controller.hideDrawer.listen((hideDrawer) {
      if (hideDrawer) {
        widget.scaffoldKey.currentState!.closeDrawer();
        controller.hideDrawer.value = false;
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    if (controller.hasListeners) {
      controller.removeListener(() {});
    }
    super.dispose();
  }

  List<Widget> screens(double maxWidth) => [
        // Overview(maxWidth: maxWidth),
      
      ];

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return Redirect(
      child: Scaffold(
        key: widget.scaffoldKey,
        appBar:
            ResponsiveWidget.isLargeScreen() ? null : AppBar(toolbarHeight: 0),
        drawer: ResponsiveWidget.isLargeScreen()
            ? null
            : const navigation.NavigationDrawer(isFull: false),
        backgroundColor: CustomColors.peach[4],
        body: LoadingWrapper(
          child: LayoutBuilder(builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;

            return Container(
              height: constraints.maxHeight,
              color: CustomColors.peach[4],
              child: Stack(
                children: [
                  SingleChildScrollView(
                    controller: scrollController,
                    child: PageStorage(
                      bucket: PageStorageBucket(),
                      child: screens(maxWidth)[
                          pages.indexOf(Get.currentRoute.split('/').last)],
                    ),
                  ),

                  if (ResponsiveWidget.isLargeScreen(maxWidth: maxWidth))
                    Container(
                      width: maxWidth * (2 / 9),
                      margin: const EdgeInsets.only(
                          top: Constants.screenHeight * 0.11),
                      child: const navigation.NavigationDrawer(
                        isFull: true,
                      ),
                    ),
                  // _appBar(context, maxWidth)
                  appBar(),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget appBar() {
    return ResponsiveWidget(
      largeScreen: largeScreen(),
      mediumScreen: smallScreen(),
      smallScreen: smallScreen(),
    );
  }

  Widget largeScreen() {
    User? user = SessionManager.instance.user;

    return GlassmorphicAppBar(
      child: LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth;

        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(width: width * 0.05),
            const Expanded(child: SizedBox()),
            
          ],
        );
      }),
    );
  }

  Widget smallScreen() {
    return GlassmorphicAppBar(
      showName: false,
      child: LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth;

        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(width: width * 0.05),
            IconButton(
              onPressed: () {
                Get.find<DefaultController>().openDrawer();
              },
              icon: const SVG('assets/icons/menu.svg',
                  height: 21,
                  width: 12,
                  color: CustomColors.grey,
                  semanticsLabel: "Menu"),
            ),
            const Expanded(child: SizedBox()),
            
          ],
        );
      }),
    );
  }
}
