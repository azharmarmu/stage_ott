import 'package:flutter/material.dart';
import 'package:stage_ott/core/utils/app_utils.dart';

class BaseTemplate extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton, bottomNavigationBar;
  final Widget body;
  final bool canPop;
  final Function()? onPopInvoked;
  const BaseTemplate({
    super.key,
    this.appBar,
    required this.body,
    this.canPop = true,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.onPopInvoked,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (bool didPop, result) {
        if (onPopInvoked != null) {
          onPopInvoked!();
        }
      },
      child: Scaffold(
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: appBar,
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            removeFocus(context);
          },
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.topCenter,
            children: [
              body,
            ],
          ),
        ),
      ),
    );
  }
}

class GestureRemoveFocus extends StatelessWidget {
  final Widget child;
  const GestureRemoveFocus({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => removeFocus(context),
      child: child,
    );
  }
}
