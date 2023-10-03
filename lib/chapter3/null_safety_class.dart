class Person {
  String name;
  String surname;

  // comment out the constructor - for an error ;)
  Person(this.name, this.surname);
}

class Person2 {
  late String name;
  late String surname;
  Person2.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    surname = map['surname'];
  }
}

class Person3 {
  late String name;
  late String surname;
  int? age;
  Person3(this.name, this.surname, {this.age});
}

void main(List<String> args) {
  var bruce = Person3('Bruce', 'Wayne', age: 42);
  if (bruce.age! < 18) {
    print('minor');
  }
}
