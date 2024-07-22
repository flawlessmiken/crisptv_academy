// import 'package:flutter/material.dart';

// import 'package:cripstv_academy/config/config.dart';
// import 'package:cripstv_academy/pages/shared/shared.dart';

// class SvgRowButton extends StatelessWidget {
//   const SvgRowButton({
//     Key? key,
//     this.text,
//     this.svgPath,
//     this.iconSize,
//     this.onPressed,
//     this.trailing,
//     this.color = Colors.black,
//     this.textColor,
//   }) : super(key: key);

//   final String? text;
//   final String? svgPath;
//   final Size? iconSize;
//   final VoidCallback? onPressed;
//   final Color? color;
//   final Color? textColor;
//   final Widget? trailing;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onPressed,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           svgPath != null
//               ? SVG(
//                   svgPath!,
//                   color: color,
//                   height: iconSize?.height ?? 32,
//                   width: iconSize?.width ?? 32,
//                 )
//               : const SizedBox(width: 5),

//           const SizedBox(width: 5),

//           CustomText(
//             text ?? '',
//             style: TextStyles(
//                 color: textColor ?? CustomColors.white
//             ).textSubtitleExtraLarge
//           ),

//           trailing ??
//               const SizedBox(height: 5)
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:cripstv_academy/config/config.dart';
import 'package:cripstv_academy/pages/shared/shared.dart';

class SvgRowButton extends StatelessWidget {
  const SvgRowButton({
    Key? key,
    this.text,
    this.svgPath,
    this.iconSize,
    this.onPressed,
    this.trailing,
    this.color = Colors.black,
    this.textColor,
    this.borderColor, 
    this.backgroundColor, 
  }) : super(key: key);

  final String? text;
  final String? svgPath;
  final Size? iconSize;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final Widget? trailing;
  final Color? borderColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.transparent), // Apply border color
          borderRadius: BorderRadius.circular(16.0), // Adjust the border radius as needed
          color: backgroundColor,
        ),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            svgPath != null
                ? SVG(
                    svgPath!,
                    color: color,
                    height: iconSize?.height ?? 32,
                    width: iconSize?.width ?? 32,
                  )
                : const SizedBox(width: 5),
            const SizedBox(width: 5),
            CustomText(
              text ?? '',
              style: TextStyles(
                color: textColor ?? CustomColors.white,
              ).textSubtitleExtraLarge,
            ),
            trailing ?? const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
