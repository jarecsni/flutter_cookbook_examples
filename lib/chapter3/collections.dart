void main(List<String> args) {
  // listPlayground();
  // mapPlayground();
  // setPlayground();
  collectionControlFlow();
}

void listPlayground() {
  final List<int> numbers = [1, 2, 3, 5, 7];
  numbers.add(11);
  numbers.addAll([8, 17, 35]);
  numbers[1] = 15;
  print("the second number is ${numbers[1]}");
  for (int number in numbers) {
    print(number);
  }
}

void mapPlayground() {
  final Map<String, int> ages = {
    'Clark': 25,
    'Peter': 35,
    'Bruce': 22,
  };
  ages['Steve'] = 48;
  final ageOfPeter = ages['Peter'];
  print("Peter is $ageOfPeter years old.");
  ages.forEach((String name, int age) {
    print("$name is $age years old.");
  });
}

void setPlayground() {
  final Set<String> ministers = {"Justin", "Stephen", "Paul", "Jean", "Pierre"};
  ministers.addAll({'John', 'Pierre'});
  final isJustinAMinister = ministers.contains('Justin');
  print('Justin is ${isJustinAMinister ? '' : 'not '}a minister');
  for (String primeMinister in ministers) {
    print("$primeMinister is a prime minister.");
  }
}

void collectionControlFlow() {
  const addMore = true;
  final randomNumbers = [
    34,
    232,
    54,
    32,
    if (addMore) ...[
      123,
      258,
      512,
    ],
  ];

  final doubled = [
    for (int number in randomNumbers) number * 2,
  ];

  print(doubled);
}
