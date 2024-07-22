import 'package:cripstv_academy/config/router.dart';
import 'package:cripstv_academy/core/session_manager/default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Redirect extends StatefulWidget {
  final Widget child;
  const Redirect({super.key, required this.child});

  @override
  State<Redirect> createState() => _RedirectState();
}

class _RedirectState extends State<Redirect> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final result = SessionManager.instance.userLoggedIn;
      if(!result){
        SessionManager.instance.setRedirect(Get.currentRoute)
            .then((value) => Get.offAllNamed(signInRoute));
      }
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
