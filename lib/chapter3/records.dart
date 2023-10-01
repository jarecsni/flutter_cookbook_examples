typedef HRPerson = ({String name, int age, String role});

void main() {
  var person = (name: 'Johnny', age: 42);
  print(person);
  print("${person.name} is ${person.age} old");
  const HRPerson someHRPerson = (age: 1, name: 'Joe', role: 'something');
  print(someHRPerson);
  print("momo");
  print(getPerson({'name': 'Clark', 'age': 25}));
  print("koko");
  var (String name, int age) = getPerson({'name': 'Joey', 'age': 45});
  print("$name is $age old");
}

(String, int) getPerson(Map<String, dynamic> json) {
  return (json['name'] as String, json['age'] as int);
}
