import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlurredIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String svgPath;
  final Color borderColor; // New variable for border color

  BlurredIconButton({
    required this.onPressed,
    required this.svgPath,
    this.borderColor = Colors.grey, // Default border color
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: borderColor, // Use the provided border color
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  color: borderColor.withOpacity(.45),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
         width: 50,
          height: 50,
          child: Center(
            child: IconButton(
              onPressed: onPressed,
              icon: SvgPicture.asset(
                svgPath,
                height: 24,
                width: 24,
                color: borderColor,
                semanticsLabel: "",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
