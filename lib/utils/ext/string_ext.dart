extension StringSS on String {
  String get specChar => replaceAll('_', '').replaceAll(RegExp(r'\W'), '_');
}
