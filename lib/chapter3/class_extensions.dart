extension StringExtensions on String {
  bool toBool() {
    return isNotEmpty;
  }
}

void main(List<String> args) {
  String emptyString = "";
  String nonEmptyString = "Hello Extensions!";
  print(emptyString.toBool());
  print(nonEmptyString.toBool());
}
