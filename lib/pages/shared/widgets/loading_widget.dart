import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

import 'package:cripstv_academy/config/config.dart';

import '../shared.dart';

import 'svg.dart';

class LoadingWidget extends StatefulWidget {
  final double size;
  final Duration duration;

  const LoadingWidget(
      {Key? key,
      required this.size,
      this.duration = const Duration(milliseconds: 2000)})
      : super(key: key);

  @override
  LoadingWidgetState createState() => LoadingWidgetState();
}

class LoadingWidgetState extends State<LoadingWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _sizeController;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      })
      ..repeat();

    _sizeController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward()
          ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    _sizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller,
            child: SizedBox.fromSize(
              size: Size.square(widget.size),
              child: Container(
                height: widget.size,
                width: widget.size,
                decoration: BoxDecoration(
                    border: GradientBoxBorder(
                      gradient: LinearGradient(colors: [
                        CustomColors.primary,
                        CustomColors.primary.withOpacity(0.1),
                      ]),
                      width: 2,
                    ),
                    color: Colors.transparent,
                    shape: BoxShape.circle),
              ),
            ),
            builder: (context, child) {
              return Transform.rotate(
                angle: _controller.value * 2.0 * pi,
                child: child,
              );
            },
          ),
          AnimatedBuilder(
            animation: _sizeController,
            builder: (context, child) {
              return Container(
                  height: widget.size * 0.72 - (8.0 * _sizeController.value),
                  width: widget.size * 0.72 - (8.0 * _sizeController.value),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: CustomColors.primary),
                  child: Center(
                      child: SizedBox(
                          height: widget.size * 0.54 -
                              (8.0 * _sizeController.value),
                          width: widget.size * 0.54 -
                              (8.0 * _sizeController.value),
                          child: Image.asset('assets/images/aclogo.png'))));
            },
          ),
        ],
      ),
    );
  }
}
