import 'package:cripstv_academy/config/router.dart';
import 'package:cripstv_academy/core/model/job_details.dart';
import 'package:cripstv_academy/pages/shared/widgets/job_listitem_card.dart';
import 'package:cripstv_academy/pages/shared/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobDetailGrid extends StatelessWidget {
  final double availableWidth;
  final bool isUserEvent;
  final List<JobDetails> jobs;
  const JobDetailGrid(
      {super.key,
      required this.availableWidth,
      required this.jobs,
      this.isUserEvent = false});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: ResponsiveWidget.isSmallScreen()
            ? 1
            : ResponsiveWidget.isMediumScreen()
                ? 2
                : 3,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        childAspectRatio: ResponsiveWidget.isSmallScreen()
            ? 1.6
            : ResponsiveWidget.isMediumScreen()
                ? 1.1
                : 1.2,
      ),
      itemCount: jobs.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return JobDetailsContainer(
          jobDetails: jobs[index],
          onApplyPressed: () {
              Get.toNamed(applicationFormRoute);
          },
        );
      },
    );
  }
}
