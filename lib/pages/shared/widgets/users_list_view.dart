import 'package:flutter/material.dart';
import 'package:cripstv_academy/pages/shared/shared.dart';
import 'package:cripstv_academy/config/config.dart';

class UsersListView extends StatefulWidget {
  final ScrollController? controller;
  final ScrollPhysics? physics;
  final EdgeInsets? padding;
  final String refreshCode;
  final String filter;
  final String eventId;
  final int? page;
  final int? pageSize;
  final Widget Function(
      BuildContext context, int index, int length, dynamic item) itemBuilder;
  final bool Function(List<dynamic> list, dynamic item, String filter)
      validateItem;

  const UsersListView({
    super.key,
    this.controller,
    required this.physics,
    this.padding,
    this.page,
    this.pageSize,
    required this.filter,
    required this.eventId,
    required this.itemBuilder,
    required this.validateItem,
    this.refreshCode = "",
  });

  @override
  State<UsersListView> createState() => _UsersListViewState();
}

class _UsersListViewState extends State<UsersListView> {
  int pageCount = 1;
  List<dynamic> items = [];
  String refreshCode = "";
  bool isLoading = true;

  @override
  void initState() {
    pageCount = widget.page ?? pageCount;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchItems();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.refreshCode.isNotEmpty &&
        widget.refreshCode != refreshCode &&
        mounted) {
      setState(() {
        pageCount = widget.page ?? 1;
        items.clear();
        isLoading = true;
        fetchItems();
        refreshCode = widget.refreshCode;
      });
    }

    return Column(
      children: [
        Expanded(
          child: Builder(builder: (context) {
            if (items.isEmpty) {
              return Builder(builder: (context) {
                if (isLoading) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 100),
                    child: Center(child: LoadingWidget(size: 100)),
                  );
                } else {
                  return SizedBox(
                    width: Dimen.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 30),
                        SizedBox(
                          height: 20,
                          child: CustomText(
                            'No user was found',
                            style: TextStyles(
                              color: CustomColors.grey.withOpacity(0.4),
                            ).textBodyLarge,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              });
            } else {
              return ListView.builder(
                  controller: widget.controller,
                  physics: widget.physics,
                  shrinkWrap: true,
                  padding: widget.padding ?? EdgeInsets.zero,
                  itemCount: items.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return widget.itemBuilder(
                        context, index, items.length, items[index]);
                  });
            }
          }),
        ),
      ],
    );
  }

  Future<void> fetchItems() async {
   
  }
}
