typedef HRPerson = ({String name, int age, String role});

void main() {
  var person = (name: 'Johnny', age: 42);
  print(person);
  print("${person.name} is ${person.age} old");
  const HRPerson someHRPerson = (age: 1, name: 'Joe', role: 'something');
  print(someHRPerson);
}
