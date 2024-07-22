import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cripstv_academy/controllers/controllers.dart';

import '../shared.dart';

class LoadingWrapper extends StatelessWidget {
  final Widget child;
  const LoadingWrapper({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,

        GetX<UserController>(
            builder: (controller) {
              if (controller.isLoading) {
                return const Loading();
              }else{
                return const SizedBox();
              }
            }
        ),
      ],
    );
  }
}
