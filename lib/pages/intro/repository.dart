class Repository {
  Future<bool> setup() async {
    return Future.delayed(const Duration(
      seconds: 5,
    )).then((onValue) => true);
  }
}
