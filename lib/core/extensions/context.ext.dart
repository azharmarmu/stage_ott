import 'package:flutter/material.dart';

extension AppNav on BuildContext {
  void pop([Object? result]) {
    if (mounted && Navigator.canPop(this)) {
      return Navigator.pop(this, result);
    }
  }

  void popWithDelay({Object? result, int milliseconds = 500}) {
    Future.delayed(
      Duration(milliseconds: milliseconds),
      () {
        if (mounted && Navigator.canPop(this)) {
          return Navigator.pop(this, result);
        }
      },
    );
  }

  void pop2([Object? result]) {
    if (mounted) {
      Navigator.pop(this);
    }
    if (mounted) {
      Navigator.pop(this, result);
    }
  }

  dynamic push(routeName, {Object? extra}) async {
    if (mounted) {
      return await Navigator.pushNamed(
        this,
        routeName,
        arguments: extra,
      );
    }
  }

  dynamic pushReplacement(routeName, {Object? extra}) async {
    if (mounted) {
      return await Navigator.pushReplacementNamed(
        this,
        routeName,
        arguments: extra,
      );
    }
  }

  dynamic popToAPage(String routeName, [Object? result]) {
    if (mounted && Navigator.canPop(this)) {
      return Navigator.popUntil(
        this,
        (route) => (route.settings.name == routeName),
      );
    }
  }

  dynamic popToRoot() {
    if (mounted && Navigator.canPop(this)) {
      return Navigator.popUntil(this, (route) => route.isFirst);
    }
  }

  void checkAndPop(String targetRoute) {
    // Get the current route
    final currentRoute = ModalRoute.of(this)?.settings.name;
    // Check if the current route is the same as the target route
    if (currentRoute != targetRoute) {
      Navigator.pop(this);
    }
  }
}
