class Arithmetic {
  int? first;
  int? second;
  Arithmetic({this.first, this.second});

  int add() {
    return first! + second!;
  }

  int sub() {
    return first! - second!;
  }

  int mul() {
    return first! * second!;
  }
}
