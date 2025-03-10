import 'package:intl/intl.dart';

extension StringExt on String {
  bool equals(String name) {
    return toLowerCase() == name.toLowerCase();
  }

   String convertToDateAndTime() {
    DateTime dateTime = DateTime.parse(this);
    return DateFormat('MMM d, yyyy h:mm a').format(dateTime.toLocal());
  }

  String convertToDate() {
    DateTime dateTime = DateTime.parse(this);
    return DateFormat('MMM d, yyyy').format(dateTime.toLocal());
  }

  String convertToTime() {
    DateTime dateTime = DateTime.parse(this);

    return DateFormat('h:mm a').format(dateTime.toLocal());
  }

  String formatDate() {
    DateTime dateTime = DateTime.parse(this);
    return DateFormat('MM/dd/yyyy').format(dateTime.toLocal());
  }
}

extension StringNullExt on String? {
  bool equals(String name) {
    if (this == null) return false;
    return this!.toLowerCase() == name.toLowerCase();
  }
}
