import 'package:cripstv_academy/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabSwitchHead extends StatelessWidget {
  const TabSwitchHead({
    Key? key,
    required this.data,
    required this.onButtonPressed,
    required this.selectedIndex,
  }) : super(key: key);

  final List<String> data;
  final int selectedIndex;
  final Function(int) onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < data.length; i++)
              InkWell(
                onTap: (){
                  onButtonPressed(i);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data[i].capitalize ?? "",
                        style:  TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: selectedIndex == i?CustomColors.primary: CustomColors.grey[2]),
                      ),
                  
                      Container(
                        height: 3,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: selectedIndex == i
                              ? CustomColors.primary
                              : Colors.transparent,
                        ),
                      )
                  
                      // RoundedContainer(
                      //   content: data[i],
                      //   color: selectedIndex == i
                      //       ? CustomColors.primary
                      //       : CustomColors.peach[5]!,
                      //   onTap: () {
                      //     onButtonPressed(i);
                      //   },
                      //   isFirst: data[i] == data.first,
                      //   isLast: data[i] == data.last,
                  
                      // ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      );
    });
  }
}

class RoundedContainer extends StatelessWidget {
  final String content;
  final bool isFirst;
  final bool isLast;
  final Color color;
  final VoidCallback? onTap;

  RoundedContainer({
    required this.content,
    this.isFirst = false,
    this.isLast = false,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: isFirst ? const Radius.circular(10) : Radius.zero,
            bottomLeft: isFirst ? const Radius.circular(10) : Radius.zero,
            topRight: isLast ? const Radius.circular(10) : Radius.zero,
            bottomRight: isLast ? const Radius.circular(10) : Radius.zero,
          ),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Center(
            child: Text(
              content,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
