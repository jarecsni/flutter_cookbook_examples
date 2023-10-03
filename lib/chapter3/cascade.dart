void main(List<String> args) {
  final url = URLBuilder()
    ..scheme = 'https'
    ..host = 'dart.dev'
    ..routes = [
      'guides',
      'language',
      'language-tour#cascade-notation',
    ];
  print(url);
}

class URLBuilder {
  String scheme = '';
  String host = '';
  List<String> routes = [];

  @override
  String toString() {
    final paths = [host, if (routes != []) ...routes];
    final path = paths.join('/');
    return "$scheme://$path";
  }
}
