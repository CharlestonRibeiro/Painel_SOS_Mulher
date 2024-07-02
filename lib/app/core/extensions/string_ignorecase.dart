extension IgnoreCase on String {
  bool containsIgnoreCase(String other) =>
      toLowerCase().contains(other.toLowerCase());
}
