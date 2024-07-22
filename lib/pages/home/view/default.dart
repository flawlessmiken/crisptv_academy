import 'package:carousel_slider/carousel_slider.dart';
import 'package:cripstv_academy/app.dart';
import 'package:cripstv_academy/config/colors.dart';
import 'package:cripstv_academy/config/constants.dart';
import 'package:cripstv_academy/config/styles.dart';
import 'package:cripstv_academy/core/model/job_details.dart';
import 'package:cripstv_academy/core/session_manager/default.dart';
import 'package:cripstv_academy/logic/models/user.dart';
import 'package:cripstv_academy/pages/shared/view/footer.dart';
import 'package:cripstv_academy/pages/shared/view/job_grid_view.dart';
import 'package:cripstv_academy/pages/shared/view/top_talent_grid.dart';
import 'package:cripstv_academy/pages/shared/widgets/custom_search_bar.dart';
import 'package:cripstv_academy/pages/shared/widgets/custom_text.dart';
import 'package:cripstv_academy/pages/shared/widgets/glassmorphic_app_bar.dart';
import 'package:cripstv_academy/pages/shared/widgets/loading_wrapper.dart';
import 'package:cripstv_academy/pages/shared/widgets/responsive_widget.dart';
import 'package:cripstv_academy/pages/shared/widgets/svg.dart';
import 'package:cripstv_academy/pages/shared/widgets/user_card.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

  static Widget appBar({void Function(String filter)? filterEvents}) {
    return ResponsiveWidget(
      largeScreen: largeScreen(filterEvents ?? (value) {}),
      mediumScreen: mediumScreen(filterEvents ?? (value) {}),
      smallScreen: smallScreen(filterEvents ?? (value) {}),
    );
  }

  static Widget largeScreen(void Function(String filter) filterEvents) {
    User? user = SessionManager.instance.user;
    final isSignedIn = user != null;

    return GlassmorphicAppBar(
      child: LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth;

        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(width: width * 0.05),
            SizedBox(
                width: isSignedIn ? width * .3 : width * .5,
                child: CustomSearchBar(
                  text: "Search for an event",
                  onClear: () {
                    filterEvents("");
                  },
                  onSearch: (filter) {
                    filterEvents(filter ?? "");
                  },
                )),
            const Expanded(child: SizedBox()),
          ],
        );
      }),
    );
  }

  static Widget mediumScreen(void Function(String filter) filterEvents) {
    final isSignedIn = SessionManager.instance.user != null;

    return GlassmorphicAppBar(
      showName: false,
      child: LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth;

        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(width: width * 0.05),
            SizedBox(
                width: isSignedIn ? width * .4 : width * .8,
                child: CustomSearchBar(
                  text: "Search for an event",
                  onClear: () {
                    filterEvents("");
                  },
                  onSearch: (filter) {
                    filterEvents(filter ?? "");
                  },
                )),
          ],
        );
      }),
    );
  }

  static Widget smallScreen(void Function(String filter) filterEvents) {
    return GlassmorphicAppBar(
      showName: false,
      showOnboarding: false,
      child: LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth;

        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(width: width * 0.05),
            Expanded(
              child: CustomSearchBar(
                text: "Search for an event",
                onClear: () {
                  filterEvents("");
                },
                onSearch: (filter) {
                  filterEvents(filter ?? "");
                },
              ),
            ),
            SizedBox(width: width * 0.05),
            Builder(builder: (context) {
              List<PopupMenuItem<Widget>> items = [];

              return PopupMenuButton<Widget>(
                tooltip: "Menu",
                color: CustomColors.white,
                elevation: 0,
                position: PopupMenuPosition.under,
                padding: EdgeInsets.zero,
                itemBuilder: (context) {
                  return items;
                },
                onSelected: (value) {},
                child: const SizedBox(
                  width: 21,
                  height: 21,
                  child: SVG('assets/icons/menu.svg',
                      height: 21,
                      width: 21,
                      color: CustomColors.grey,
                      semanticsLabel: "Menu"),
                ),
              );
            }),
            SizedBox(width: width * 0.025),
          ],
        );
      }),
    );
  }

  static PopupMenuItem<Widget> _menuItem(
      {required String title, required void Function() onPressed}) {
    return PopupMenuItem(
        value: null,
        enabled: false,
        padding: EdgeInsets.zero,
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            width: 150,
            height: Constants.screenHeight * 0.06,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                title,
                style: TextStyles(
                  color: CustomColors.grey,
                ).textBodyLarge,
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ));
  }

  static Widget text(String value,
      {Color color = CustomColors.white,
      TextAlign textAlign = TextAlign.start}) {
    return ResponsiveWidget(
      largeScreen: baseText(value, 40, color, textAlign),
      mediumScreen: baseText(value, 38, color, textAlign),
      smallScreen: baseText(value, 34, color, textAlign),
    );
  }

  static Widget baseText(
      String value, double fontSize, Color color, TextAlign? textAlign,
      {bool isSubtext = false}) {
    return CustomText(
      value,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: isSubtext ? FontWeight.w300 : FontWeight.w700),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: 2,
    );
  }

  static Widget subtext(String value,
      {Color color = CustomColors.white,
      TextAlign? textAlign = TextAlign.start}) {
    return ResponsiveWidget(
      largeScreen: Home.baseText(value, 22, color, textAlign, isSubtext: true),
      mediumScreen: Home.baseText(value, 20, color, textAlign, isSubtext: true),
      smallScreen: Home.baseText(value, 17, color, textAlign, isSubtext: true),
    );
  }

  static const List<CaroselModel> carouselSliders = [
    CaroselModel(
      image: "assets/images/c1.png",
      title: "We Connect Talents to Problems!",
      subtitle: "We are eager to show you the best talents for your projects ",
    ),
    CaroselModel(
      image: "assets/images/c2.png",
      title: "We Connect Clients to The Best!",
      subtitle: "We are eager to show you the best talents for your projects",
    ),
    CaroselModel(
      image: "assets/images/c3.png",
      title: "We Make Outsourcing Easy!",
      subtitle: "We are eager to show you the best talents for your projects",
    ),
  ];
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  var selectedStatus = 0;

  @override
  Widget build(BuildContext context) {
    String userId = SessionManager.instance.userId ?? "";

    return Scaffold(
      appBar: null,
      body: LoadingWrapper(
        child: LayoutBuilder(builder: (context, constraints) {
          final width = constraints.maxWidth;

          return Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                height: App.screenHeight,
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    color: CustomColors.info[4]!.withOpacity(.05),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: Constants.screenHeight * 0.15),
                        LayoutBuilder(builder: (context, constraints) {
                          final width = constraints.maxWidth;

                          return SizedBox(
                            height: ResponsiveWidget.isLargeScreen()
                                ? Constants.screenHeight * 0.35
                                : ResponsiveWidget.isMediumScreen()
                                    ? Constants.screenHeight * 0.3
                                    : Constants.screenHeight * 0.3,
                            width: width,
                            // color: CustomColors.primary,
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    if (ResponsiveWidget.isLargeScreen())
                                      Expanded(
                                          child: Padding(
                                        padding: EdgeInsets.only(
                                            left: width * .05,
                                            right: width * .02),
                                        child: UserCardWidget(),
                                      )),
                                    SizedBox(
                                      width: ResponsiveWidget.isLargeScreen()
                                          ? width * .7
                                          : width,
                                      child: CarouselSlider(
                                        options: CarouselOptions(
                                          height:
                                              ResponsiveWidget.isLargeScreen()
                                                  ? Constants.screenHeight *
                                                      0.35
                                                  : ResponsiveWidget
                                                          .isMediumScreen()
                                                      ? Constants.screenHeight *
                                                          0.3
                                                      : Constants.screenHeight *
                                                          0.25,
                                          enlargeCenterPage: true,
                                          autoPlay: true,
                                          autoPlayInterval:
                                              const Duration(seconds: 10),
                                          autoPlayAnimationDuration:
                                              const Duration(milliseconds: 800),
                                          pauseAutoPlayOnTouch: true,
                                          enableInfiniteScroll: true,
                                          viewportFraction: 0.8,
                                        ),
                                        items: Home.carouselSliders.map((item) {
                                          return Builder(
                                            builder: (BuildContext context) {
                                              return Container(
                                                width: width,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  child: Stack(
                                                    children: [
                                                      Opacity(
                                                          opacity: .9,
                                                          child:
                                                              BackgroundImage(
                                                            imagePath:
                                                                item.image ??
                                                                    "",
                                                            width: width,
                                                          )),
                                                      Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    width * .1),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Home.text(
                                                              "${item.title}",
                                                            ),
                                                            const SizedBox(
                                                                height: 4),
                                                            Home.subtext(
                                                              "${item.subtitle}",
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                        const SizedBox(height: Constants.screenHeight * 0.05),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ResponsiveWidget.isLargeScreen(
                                      maxWidth: constraints.maxWidth)
                                  ? constraints.maxWidth * .1
                                  : ResponsiveWidget.isMediumScreen(
                                          maxWidth: constraints.maxWidth)
                                      ? constraints.maxWidth * .06
                                      : constraints.maxWidth * 0.06),
                          child: Column(
                            children: [
                              Home.subtext(
                                "Based On Your Interests",
                              ),
                              const SizedBox(
                                  height: Constants.screenHeight * 0.05),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: LayoutBuilder(
                                    builder: (context, constraints) {
                                  final availableWidth = constraints.maxWidth;
                                  return Container(
                                    // color: CustomColors.white,
                                    width: ResponsiveWidget.isLargeScreen()
                                        ? availableWidth * 0.9
                                        : ResponsiveWidget.isMediumScreen()
                                            ? availableWidth * 0.9
                                            : availableWidth,

                                    child: TabSwitchHead(
                                      data: const [
                                        'All',
                                        'UI UX Design',
                                        'Graphics Design',
                                        'Motion Graphics'
                                      ],
                                      onButtonPressed: (value) {
                                        setState(() {
                                          selectedStatus = value;
                                        });
                                      },
                                      selectedIndex: selectedStatus,
                                    ),
                                  );
                                }),
                              ),
                              const SizedBox(
                                  height: Constants.screenHeight * 0.05),
                              Column(
                                children: [
                                  JobDetailGrid(
                                    jobs: [
                                      JobDetails(
                                        title: 'Ui/UX',
                                        rate: '\$20',
                                        location: 'Nigeria',
                                        description:
                                            'We are looking for a skilled designer to work on an e-commerce website. The project is to serve for a duration of 3 weeks. You...',
                                        skills:
                                            'UI design, UX research, Prototyping',
                                      ),
                                      JobDetails(
                                        title: 'Ui/UX',
                                        rate: '\$20',
                                        location: 'Nigeria',
                                        description:
                                            'We are looking for a skilled designer to work on an e-commerce website. The project is to serve for a duration of 3 weeks. You...',
                                        skills:
                                            'UI design, UX research, Prototyping',
                                      ),
                                      JobDetails(
                                        title: 'Ui/UX',
                                        rate: '\$20',
                                        location: 'Nigeria',
                                        description:
                                            'We are looking for a skilled designer to work on an e-commerce website. The project is to serve for a duration of 3 weeks. You...',
                                        skills:
                                            'UI design, UX research, Prototyping',
                                      ),
                                      JobDetails(
                                        title: 'Ui/UX',
                                        rate: '\$20',
                                        location: 'Nigeria',
                                        description:
                                            'We are looking for a skilled designer to work on an e-commerce website. The project is to serve for a duration of 3 weeks. You...',
                                        skills:
                                            'UI design, UX research, Prototyping',
                                      ),
                                      JobDetails(
                                        title: 'Ui/UX',
                                        rate: '\$20',
                                        location: 'Nigeria',
                                        description:
                                            'We are looking for a skilled designer to work on an e-commerce website. The project is to serve for a duration of 3 weeks. You...',
                                        skills:
                                            'UI design, UX research, Prototyping',
                                      )
                                    ],
                                    availableWidth: width,
                                  )
                                ],
                              ),
                              const SizedBox(
                                  height: Constants.screenHeight * 0.04),

                              Column(
                                children: [
                                  TopTalentGrid(
                                    topTalents: [
                                      TopTalent(
                                        name: 'Ui/UX',
                                        description: '\$20',
                                        image: 'Nigeria',
                                      ),
                                      TopTalent(
                                        name: 'Ui/UX',
                                        description: '\$20',
                                        image: 'Nigeria',
                                      ),
                                      TopTalent(
                                        name: 'Ui/UX',
                                        description: '\$20',
                                        image: 'Nigeria',
                                      ),
                                      TopTalent(
                                        name: 'Ui/UX',
                                        description: '\$20',
                                        image: 'Nigeria',
                                      ),
                                      TopTalent(
                                        name: 'Ui/UX',
                                        description: '\$20',
                                        image: 'Nigeria',
                                      ),
                                      TopTalent(
                                        name: 'Ui/UX',
                                        description: '\$20',
                                        image: 'Nigeria',
                                      ),
                                      TopTalent(
                                        name: 'Ui/UX',
                                        description: '\$20',
                                        image: 'Nigeria',
                                      ),
                                    ],
                                    availableWidth: width,
                                  )
                                ],
                              ),

                              // UserCreatedEventsList(
                              //     availableWidth: width, userId: userId),
                              const SizedBox(
                                  height: Constants.screenHeight * 0.03),
                            ],
                          ),
                        ),
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
              Home.appBar(filterEvents: (filter) {})
            ],
          );
        }),
      ),
    );
  }

  Widget navigationWidget(double availableWidth,
      {required ValueNotifier<int> page, required int count}) {
    final maxPage = (count / 6).ceil();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: IconButton(
            onPressed: () {
              if (page.value > 1) {
                page.value = page.value - 1;
              }
            },
            icon: SVG('assets/icons/caret_left.svg',
                height: 20,
                width: 20,
                color:
                    page.value > 1 ? CustomColors.grey : CustomColors.grey[3],
                semanticsLabel: "Previous"),
          ),
        ),
        SizedBox(width: availableWidth * 0.025),
        CustomText(
          "PAGE ${page.value} OF ${maxPage == 0 ? 1 : maxPage}",
          style: TextStyles(color: CustomColors.grey[2]).textBodyLarge,
        ),
        SizedBox(width: availableWidth * 0.025),
        SizedBox(
          width: 40,
          height: 40,
          child: IconButton(
            onPressed: () {
              if (page.value < maxPage) {
                page.value = page.value + 1;
              }
            },
            icon: SVG('assets/icons/caret_right.svg',
                height: 20,
                width: 20,
                color: page.value < maxPage
                    ? CustomColors.grey
                    : CustomColors.grey[3],
                semanticsLabel: "Next"),
          ),
        ),
      ],
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
    required this.imagePath,
    required this.width,
  }) : super(key: key);

  final String imagePath;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Stack(
        children: [
          Container(
            color: CustomColors.grey[3],
            child: Opacity(
              opacity: .3,
              child: Image.asset(
                imagePath,
                width: width,
                fit: BoxFit.fill,
                color: const Color.fromARGB(255, 147, 147, 147),
                colorBlendMode: BlendMode.multiply,
              ),
            ),
          )
          // CachedNetworkImage(
          //   imageUrl: Constants.sampleImage2,
          //   placeholder: (context, url) => const SizedBox(),
          //   imageBuilder: (context, imageProvider) => Container(
          //     decoration: BoxDecoration(
          //       color: CustomColors.primary,
          //       image: DecorationImage(
          //           image: imageProvider,
          //           fit: BoxFit.fitWidth,
          //           colorFilter: ColorFilter.mode(
          //               const Color.fromARGB(255, 173, 173, 173).withOpacity(.9),
          //               BlendMode.multiply)),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class CaroselModel {
  final String? title;
  final String? subtitle;
  final String? image;
  const CaroselModel({this.image, this.title, this.subtitle});
}
