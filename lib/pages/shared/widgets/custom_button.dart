import 'package:flutter/material.dart';

import 'package:cripstv_academy/config/config.dart';

import '../shared.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String text;
  final String? subtext;
  final void Function() onPressed;
  final double? height;
  final double? width;
  Color? color;
  Color? textColor;
  Color? borderColor;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final String? icon;
  final double? iconSize;
  final bool? isOutlined;

  CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.height,
    this.width,
    this.color,
    this.textColor,
    this.borderColor,
    this.margin,
    this.subtext,
    this.padding,
    this.icon,
    this.iconSize,
    this.isOutlined,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isOutlined ?? false) {
      borderColor ??= CustomColors.primary;
      color ??= Colors.transparent;
      textColor ??= CustomColors.primary;
    }

    final borderRadius = (height ?? Constants.screenHeight * 0.07);

    return Container(
      height: height ?? Constants.screenHeight * 0.07,
      width: width ?? Dimen.width * 0.9,
      decoration: BoxDecoration(
          color: color ?? CustomColors.primary,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          border: borderColor != color
              ? Border.all(
                  color: borderColor ?? color ?? CustomColors.primary,
                  width: 1.5,
                )
              : null),
      margin: margin ?? EdgeInsets.zero,
      child: MaterialButton(
        height: height ?? Constants.screenHeight * 0.07,
        minWidth: width ?? Dimen.width * 0.9,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        elevation: 0,
        onPressed: onPressed,
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(child: SizedBox()),
              if (icon != null)
                SVG(icon!,
                    height: iconSize ?? 24,
                    width: iconSize ?? 24,
                    color: textColor ?? Colors.white,
                    semanticsLabel: ""),
              if (icon != null)
                SizedBox(width: Dimen.horizontalMarginWidth * 0.5),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (subtext != null)
                    CustomText(subtext!,
                        style: TextStyles(color: textColor ?? Colors.white)
                            .textBodySmall),
                  CustomText(text,
                      style: TextStyles(color: textColor ?? Colors.white)
                          .textBodyLarge),
                ],
              ),
              const Expanded(child: SizedBox()),
            ],
          )),
        ),
      ),
    );
  }
}
