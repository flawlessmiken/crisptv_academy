import 'dart:ui';

import 'package:cripstv_academy/config/colors.dart';
import 'package:flutter/material.dart';

class AnimatedImage extends StatefulWidget {
  final int index;
  final double height;
  final String text;
  final String image;
  final Color backgroundColor;

  const AnimatedImage({
    required this.index,
    required this.height,
    required this.text,
    required this.image,
    required this.backgroundColor,
  });

  @override
  State<AnimatedImage> createState() => AnimatedImageState();
}

class AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late AnimationController scrollController;
  late Animation<Offset> scrollAnimation;

  @override
  void initState() {
    super.initState();

    scrollController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    scrollAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: scrollController,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.linearToEaseOut,
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = widget.height;

    return InkWell(
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {},
      onHover: (value) {
        if (value) {
          scrollController.forward();
        } else {
          scrollController.reverse();
        }
      },
      child: Container(
        width: double.infinity,
        height: height,
        // color: widget.backgroundColor,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              LayoutBuilder(builder: (context, constraints) {
                return Row(
                  children: [
                    const Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 5,
                      child: Text(
                        widget.text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                        maxLines: 3,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const Expanded(flex: 1, child: SizedBox()),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: height,
                        width: constraints.maxWidth,
                        child: Builder(builder: (context) {
                          // final width = ResponsiveWidget.isLargeScreen()
                          //     ? constraints.maxWidth * 0.3
                          //     : ResponsiveWidget.isMediumScreen()
                          //         ? constraints.maxWidth * 0.4
                          //         : constraints.maxWidth * 0.4;
                          return FittedBox(
                              fit: BoxFit.cover,
                              child: Container(
                                width: constraints.maxWidth,
                                height: height,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/talent.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )

                              //  SVG(widget.image,
                              //     height: height * 0.8,
                              //     width: width,
                              //     semanticsLabel: "Image"),
                              );
                        }),
                      ),
                    ),
                    const Expanded(flex: 1, child: SizedBox()),
                  ],
                );
              }),
              Align(
                alignment: Alignment.bottomCenter,
                child: SlideTransition(
                  position: scrollAnimation,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: height * 0.4,
                        width: double.infinity,
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: CustomColors.grey.withOpacity(.45)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.grey.withOpacity(.7),
                        height: height * 0.4,
                        width: double.infinity,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
