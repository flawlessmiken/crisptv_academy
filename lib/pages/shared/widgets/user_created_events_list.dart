import 'package:flutter/material.dart';

import 'package:cripstv_academy/core/core.dart';

import 'package:cripstv_academy/config/config.dart';
import 'package:cripstv_academy/pages/shared/shared.dart';

import 'blurred_icon.dart';

class UserCreatedEventsList extends StatefulWidget {
  final String userId;
  final String? title;
  const UserCreatedEventsList(
      {super.key,
      required this.availableWidth,
      required this.userId,
      this.title});

  final double availableWidth;

  @override
  State<UserCreatedEventsList> createState() => _UserCreatedEventsListState();
}

class _UserCreatedEventsListState extends State<UserCreatedEventsList> {
  bool isFetching = false;
  List<EventRecord> events = [];

  int currentIndex = 0;
  int itemsPerPage = 3;

  List<EventRecord> getDisplayedItems() {
    int start = currentIndex;
    int end = (currentIndex + itemsPerPage).clamp(0, events.length);

    return events.sublist(start, end);
  }

  void showNext() {
    setState(() {
      currentIndex = (currentIndex + itemsPerPage).clamp(0, events.length);
    });
  }

  void showPrevious() {
    setState(() {
      currentIndex = (currentIndex - itemsPerPage).clamp(0, events.length);
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getEvents();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<EventRecord> displayedItems = getDisplayedItems();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
            widget.title ?? "My Events",
            style: TextStyles(color: CustomColors.grey).displaySubtitleMedium,
          ),
        ),
        const SizedBox(height: Constants.screenHeight * 0.05),
        Builder(builder: (context) {
          if (isFetching) {
            return const Column(
              children: [
                SizedBox(height: Constants.screenHeight * 0.05),
                LoadingWidget(size: 100),
                SizedBox(height: Constants.screenHeight * 0.05),
              ],
            );
          } else {
            if (events.isEmpty) {
              return Center(
                child: CustomText(
                  'Could not get any event',
                  style: TextStyles(color: CustomColors.grey).textBodyLarge,
                ),
              );
            } else {
              final controller = ScrollController();

              return Stack(
                children: [
                  SizedBox(
                    height: Constants.screenHeight * 0.575,
                    child: ListView.builder(
                      controller: controller,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: displayedItems.length,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final eventRecord = displayedItems[index];

                        bool isUserEvent = false;

                        final userId = SessionManager.instance.userId ?? "";

                        if (userId.isNotEmpty &&
                            (eventRecord.userId ?? '').isNotEmpty) {
                          isUserEvent = userId == (eventRecord.userId ?? "");
                        }

                        return Container(
                          height: Constants.screenHeight * 0.575,
                          width: Constants.screenHeight * 0.575 * 0.75,
                          margin: const EdgeInsets.only(right: 20),
                          child: Container(),
                        );
                      },
                    ),
                  ),

                  if(events.length > 3)
                  Positioned(
                      right: 20,
                      bottom: 30,
                      child: Column(
                        children: [
                          BlurredIconButton(
                            onPressed: currentIndex + itemsPerPage < events.length ? showNext : null,
                            borderColor: CustomColors.primary,
                            svgPath: 'assets/icons/fowardarrow.svg',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BlurredIconButton(
                            onPressed: currentIndex > 0 ? showPrevious : null,
                            borderColor: CustomColors.primary,
                            svgPath: 'assets/icons/backarrow.svg',
                          )
                        ],
                      ))
                ],
              );
            }
          }
        }),
      ],
    );
  }

  void getEvents() async {
   
  }
}
