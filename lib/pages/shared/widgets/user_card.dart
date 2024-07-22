import 'package:cripstv_academy/config/config.dart';
import 'package:cripstv_academy/pages/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.grey[4]!.withOpacity(.4),
      padding: const EdgeInsets.all(20),
      child:  SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: (){
                     Get.toNamed(profileRoute);

                  },
                  child: const CircularAvatarColumn(
                    name: "Fred Will",
                    role: "Product Designer",
                  ),
                ),
              ],
            ),
            const ExpandableWidget(
              title: "Connect",
              children: ["Twitter", "Instagram"],
            ),
            const ExpandableWidget(
              title: "Ongoing",
              children: ["", ""],
            ),
          ],
        ),
      ),
    );
  }
}

class CircularAvatarColumn extends StatelessWidget {
  final String name;
  final String role;

  const CircularAvatarColumn({
    Key? key,
    required this.name,
    required this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          // Add your avatar image here
          radius: 30,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              name,
              style: TextStyles(
                color: CustomColors.grey,
              ).textTitleLarge,
              textAlign: TextAlign.start,
            ),
            Text(role),
          ],
        ),
      ],
    );
  }
}

class ExpandableWidget extends StatelessWidget {
  final String title;
  final List<String> children;

  const ExpandableWidget({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      children: children.map((item) => ListTile(title: Text(item))).toList(),
    );
  }
}
