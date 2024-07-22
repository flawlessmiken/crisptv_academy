import 'package:flutter/material.dart';
import 'package:cripstv_academy/config/config.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
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
      return SizedBox(
        height: 20,
        child: Row(
          children: [
            for (int i = 0; i < data.length; i++)
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    onButtonPressed(i);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        selectedIndex == i
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        size: 20,
                        color: selectedIndex == i
                            ? CustomColors.primary
                            : CustomColors.grey[4],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        data[i],
                        style: const TextStyle(
                            fontSize: 15, color: CustomColors.grey),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
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
