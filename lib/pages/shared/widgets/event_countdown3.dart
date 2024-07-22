// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:shimmer_animation/shimmer_animation.dart';

// import 'package:cripstv_academy/app.dart';
// import 'package:cripstv_academy/config/config.dart';
// import 'package:cripstv_academy/pages/shared/shared.dart';

// class EventCountdown extends StatefulWidget {
//   final String date;
//   const EventCountdown({Key? key, required this.date}) : super(key: key);

//   @override
//   State<EventCountdown> createState() => _EventCountdownState();
// }

// class _EventCountdownState extends State<EventCountdown> {
//   Duration duration = Duration(
//       seconds: DateTime(2023, 01, 01, 01, 00, 0, 0, 0)
//           .difference(DateTime.now())
//           .inSeconds);

//   Timer timer = Timer(const Duration(seconds: 1), () {});

//   void startTimer() {
//     timer = Timer.periodic(const Duration(seconds: 1), (_) => updateDuration());
//   }

//   void stopTimer() {
//     timer.cancel();
//   }

//   void updateDuration() {
//     final int seconds;

//     seconds = duration.inSeconds - 1;

//     if (seconds < 0) {
//       timer.cancel();
//     } else {
//       if (mounted) {
//         setState(() {
//           duration = Duration(seconds: seconds);
//         });
//       }
//     }
//   }

//   @override
//   void initState() {
//     duration =
//         Duration(seconds: parseDateTime(widget.date).difference(DateTime.now()).inSeconds);
//     startTimer();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     DateTime dateTime =
//         DateTime.fromMillisecondsSinceEpoch(duration.inMilliseconds);

//     if (duration.inMilliseconds.isNegative) {
//       dateTime =
//           DateTime(parseDateTime(widget.date).year, parseDateTime(widget.date).month, 00, 00, 00, 0, 0, 0);
//     }

//     return LayoutBuilder(builder: (context, constraints) {
//       final maxWidth = constraints.maxWidth;

//       return Column(
//         // mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: ResponsiveWidget.isSmallScreen()
//                 ? 10
//                 : Constants.screenHeight * .12,
//           ),
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               timeWidget(
//                   "DAYS",
//                   duration.inMilliseconds.isNegative
//                       ? "0"
//                       : dateTime.day.toString(),
//                   maxWidth),
//               const SizedBox(
//                 width: 10,
//               ),
//               // const Expanded(child: SizedBox()),
//               colon(maxWidth),
//               const SizedBox(
//                 width: 10,
//               ),
//               // const Expanded(child: SizedBox()),
//               timeWidget("HOURS", dateTime.hour.toString(), maxWidth),
//               // const Expanded(child: SizedBox()),
//             ],
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               //   const SizedBox(
//               //   width: 20,
//               // ),
//               // const Expanded(child: SizedBox()),
//               timeWidget("MINUTES", dateTime.minute.toString(), maxWidth),
//               const SizedBox(
//                 width: 10,
//               ),
//               // const Expanded(child: SizedBox()),
//               colon(maxWidth),
//               const SizedBox(
//                 width: 10,
//               ),
//               // const Expanded(child: SizedBox()),
//               timeWidget("SECONDS", dateTime.second.toString(), maxWidth),
//             ],
//           ),
//         ],
//       );
//     });
//   }

//   Widget timeWidget(String identifier, String value, double maxWidth) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: const BorderRadius.all(Radius.circular(12)),
//             color: CustomColors.white,
//             boxShadow: <BoxShadow>[
//               BoxShadow(
//                   offset: const Offset(2, 4),
//                   blurRadius: 15,
//                   color: CustomColors.grey.withOpacity(0.25))
//             ],
//           ),
//           child: ClipRRect(
//             borderRadius: const BorderRadius.all(Radius.circular(12)),
//             child: Shimmer(
//               child: Container(
//                   height: ResponsiveWidget.isSmallScreen()
//                       ? App.screenHeight * .08
//                       : ResponsiveWidget.isMediumScreen()
//                           ? App.screenHeight * .15
//                           : App.screenHeight * .12,
//                   width: maxWidth * 0.3,
//                   decoration: BoxDecoration(
//                       color: CustomColors.grey[4]!.withOpacity(0.25),
//                       borderRadius: BorderRadius.circular(12))),
//             ),
//           ),
//         ),
//         Column(
//           children: [
//             CustomText(value,
//                 style: TextStyle(
//                     fontFamily: "DMSans",
//                     fontSize: maxWidth * 0.18 * 0.375,
//                     fontWeight: FontWeight.w900,
//                     letterSpacing: 0.3,
//                     color: CustomColors.grey)),
//             SizedBox(height: Dimen.verticalMarginHeight * 0.25),
//             CustomText(identifier,
//                 style: TextStyle(
//                     fontFamily: "DMSans",
//                     fontSize: maxWidth * 0.18 * 0.135,
//                     fontWeight: FontWeight.w700,
//                     letterSpacing: 0.3,
//                     color: CustomColors.grey)),
//           ],
//         )
//       ],
//     );
//   }

//   Widget colon(double maxWidth) {
//     return CustomText(":",
//         style: TextStyle(
//             fontFamily: "DMSans",
//             fontSize: maxWidth * 0.18 * 0.5,
//             fontWeight: FontWeight.w900,
//             letterSpacing: 0.3,
//             color: CustomColors.grey));
//   }
// }
