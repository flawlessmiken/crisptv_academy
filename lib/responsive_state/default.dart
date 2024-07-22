import 'package:flutter/material.dart';

import 'view_state.dart';

// ignore: must_be_immutable
class ResponsiveState extends StatelessWidget {
  final ViewState state;
  final Widget idleWidget;
  Widget? busyWidget;
  Widget? dataFetchedWidget;
  Widget? noDataAvailableWidget;
  Widget? errorWidget;
  Widget? successWidget;
  Widget? waitingForInputWidget;

  // returns a widget based on the provided ViewState
  ResponsiveState({
    Key? key,
    required this.state,
    required this.idleWidget,
    this.busyWidget,
    this.errorWidget,
    this.dataFetchedWidget,
    this.noDataAvailableWidget,
    this.successWidget,
    this.waitingForInputWidget,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ViewState.idle:
        return idleWidget;
      case ViewState.busy:
        return busyWidget ?? idleWidget;
      case ViewState.dataFetched:
        return dataFetchedWidget ?? idleWidget;
      case ViewState.noDataAvailable:
        return noDataAvailableWidget ?? idleWidget;
      case ViewState.error:
        return errorWidget ?? idleWidget;
      case ViewState.success:
        return successWidget ?? idleWidget;
      default:
        return idleWidget;
    }
  }
}