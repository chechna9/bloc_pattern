Stream<String> siuuStream() async* {
  for (var i = 0; i < 10; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield 'Siuuu $i';
  }
}

void main() {
  siuuStream().listen(
    (event) {
      print(event);
    },
  );
}
