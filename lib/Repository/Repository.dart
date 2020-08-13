

class Repository {
  int _count = 0;

  static Repository _instance = Repository.inner();
  Repository.inner();

  factory Repository() {
    return _instance;
  }
  int get count {
    return _count;
  }

  void increment() {
    _count++;
  }

  void clear() {
    _count = 0;
  }

  void double() {
    _count *= 2;
  }
}
