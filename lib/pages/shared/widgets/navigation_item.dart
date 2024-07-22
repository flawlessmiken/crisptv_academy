import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cripstv_academy/config/config.dart';

import '../shared.dart';

class NavigationItem extends StatefulWidget {
  final String iconPath, title;
  final void Function() onPressed;

  const NavigationItem({Key? key, required this.iconPath, required this.title, required this.onPressed}) : super(key: key);

  @override
  State<NavigationItem> createState() => _NavigationItemState();
}

class _NavigationItemState extends State<NavigationItem> {
  @override
  Widget build(BuildContext context) {

    String last = Get.currentRoute.split('/').last;

    if(last.contains('_')){
      final fields = last.split('_');
      last = "";
      for(String field in fields){
        if(last == "") {
          last = field;
        } else {
          last = "$last $field";
        }
      }
    }

    final bool isSelected = last == widget.title.toLowerCase();

    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isSelected ? CustomColors.primary : CustomColors.white,
      ),
      child: MaterialButton(
        height: 60,
        minWidth: double.infinity,
        onPressed: widget.onPressed,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              const SizedBox(width: 14),

              SVG(
                  widget.iconPath,
                  height: 20,
                  width: 20,
                  color: isSelected ? CustomColors.white : CustomColors.grey,
                  semanticsLabel: "Icon"
              ),

              const SizedBox(width: 10),

              CustomText(
                  widget.title,
                  style: TextStyle(
                      color: isSelected ? CustomColors.white : CustomColors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
