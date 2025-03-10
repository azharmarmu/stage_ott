import 'dart:io';
import 'package:flutter/material.dart';

void removeFocus(BuildContext context) {
  final currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}

String getOS() {
  if (Platform.isAndroid) {
    return 'Android';
  } else if (Platform.isIOS) {
    return 'iOS';
  } else {
    return 'Default';
  }
}
