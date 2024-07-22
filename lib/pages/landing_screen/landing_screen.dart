import 'package:cripstv_academy/app.dart';
import 'package:cripstv_academy/config/colors.dart';
import 'package:cripstv_academy/config/constants.dart';
import 'package:cripstv_academy/pages/shared/view/footer.dart';
import 'package:cripstv_academy/pages/shared/widgets/glassmorphic_app_bar.dart';
import 'package:cripstv_academy/pages/shared/widgets/loading_wrapper.dart';
import 'package:flutter/material.dart';

import 'first_block.dart';
import 'second_block.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: LoadingWrapper(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: App.screenHeight,
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  color: CustomColors.white,
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: Constants.screenHeight * 0.15),
                        const FirstBlock(),
                        const SizedBox(height: Constants.screenHeight * 0.1),
                        const SecondBlock(),
                        const SizedBox(height: Constants.screenHeight * 0.15),
                        LayoutBuilder(builder: (context, constraints) {
                          final width = constraints.maxWidth;
                          return Footer(
                            width: width,
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const GlassmorphicAppBar()
          ],
        ),
      ),
    );
  }
}
