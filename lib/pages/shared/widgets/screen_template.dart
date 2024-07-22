import 'package:flutter/material.dart';

import 'package:cripstv_academy/config/config.dart';
import 'package:cripstv_academy/pages/shared/widgets/responsive_widget.dart';

class ScreenTemplate extends StatelessWidget {
  final double? height;
  final Widget child;
  const ScreenTemplate({super.key, required this.child, this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      color: CustomColors.peach[4],
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          margin: EdgeInsets.only(
              left: ResponsiveWidget.isLargeScreen()
                  ? (constraints.maxWidth * (2 / 9)) + 20
                  : 0,
              top: Constants.screenHeight * 0.13),
          child: child,
        );
      }),
    );
  }
}
