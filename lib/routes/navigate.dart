// Flutter imports:
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Helps navigate to pages without `BuildContext`
abstract class Navigate {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static toNamed(String routeName, {Object? argument, Map<String, String>? parameter}) {
    return navigatorKey.currentContext?.go(routeName, extra: argument);
  }

  static void pop([Object? result]) {
    Navigator.of(navigatorKey.currentContext!).pop(result);
  }

  static bool canPop() {
    return navigatorKey.currentContext?.canPop() ?? false;
  }

  static void mayBePop([Object? result]) {
    Navigator.of(navigatorKey.currentContext!).maybePop(result);
  }

  static void popAll() {
    Future.delayed(Duration.zero, () {
      navigatorKey.currentState?.popUntil((route) => route.isFirst);
    });
  }
}
