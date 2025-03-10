extension StringExt on String {
  bool equals(String name) {
    return toLowerCase() == name.toLowerCase();
  }
}

extension StringNullExt on String? {
  bool equals(String name) {
    if (this == null) return false;
    return this!.toLowerCase() == name.toLowerCase();
  }
}
