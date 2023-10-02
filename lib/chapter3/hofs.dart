List<Map> data = [
  {'first': 'Nada', 'last': 'Mueller', 'age': 10},
  {'first': 'Kurt', 'last': 'Gibbons', 'age': 9},
  {'first': 'Natalya', 'last': 'Compton', 'age': 15},
  {'first': 'Kaycee', 'last': 'Grant', 'age': 20},
  {'first': 'Kody', 'last': 'Ali', 'age': 17},
];

class Name {
  final String first;
  final String last;
  Name(this.first, this.last);

  @override
  String toString() {
    return "$first $last";
  }
}

List<Name> mapping() => data.map<Name>((Map rawName) {
      final first = rawName['first'];
      final last = rawName['last'];
      return Name(first, last);
    }).toList();

void main(List<String> args) {
  sorting();
  filtering();
  reducing();
  flattening();
}

void sorting() {
  final names = mapping();
  names.sort((a, b) => a.last.compareTo(b.last));
  print('');
  print('Alphabetical List of Names');
  names.forEach(print);
}

void filtering() {
  final names = mapping();
  final onlyMs = names.where((name) => name.last.startsWith('M'));
  print('');
  print('Filters name list by M');
  onlyMs.forEach(print);
}

reducing() {
  final allAges = data.map<int>((person) => person['age']);
  final total = allAges.reduce((total, age) => total + age);
  final average = total / allAges.length;
  print("The average age is $average");
}

void flattening() {
  final matrix = [
    [1, 0, 0],
    [0, 0, -1],
    [0, 1, 0],
  ];
  final linear = matrix.expand<int>((row) => row);
  print(linear);
}
