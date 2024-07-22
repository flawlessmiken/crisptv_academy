import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:cripstv_academy/config/config.dart';

import '../shared.dart';

class Loading extends StatelessWidget {
  final double size;
  final Duration duration;

  const Loading({Key? key, this.size = 90.0,
    this.duration = const Duration(milliseconds: 2000)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      CustomColors.grey.withOpacity(0.4),
                      CustomColors.grey.withOpacity(0.1)
                    ]
                ),
              ),
            ),
          ),
        ),

        LoadingWidget(size: size, duration: duration),

      ],
    );
  }
}
