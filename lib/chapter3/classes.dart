class Name {
  final String first;
  final String last;

  Name(this.first, this.last);

  @override
  String toString() {
    return "$first $last";
  }
}

class OfficialName extends Name {
  final String _title;

  OfficialName(this._title, String first, String last) : super(first, last);

  @override
  String toString() {
    return "$_title ${super.toString()}";
  }
}

void main(List<String> args) {
  final name = OfficialName('Mr', 'Johnny', 'Jarecsni');
  print(name);
}

class AnInterface {
  void doSomething() {}
  void doSomethingElse() {}
}

class AnImplementerOfAnInterface implements AnInterface {
  @override
  void doSomething() {
    // TODO: implement doSomething
  }

  @override
  void doSomethingElse() {
    // TODO: implement doSomethingElse
  }
}
