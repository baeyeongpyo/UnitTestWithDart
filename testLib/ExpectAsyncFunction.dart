import 'package:test/test.dart';

main(List<String> args) {
  test("Future Test", () async {
    int number = await Future.value(10);
    expect(number, equals(10));
  });

  test("stream counter test", () {
    Stream<int> stream = Stream.fromIterable([1, 2, 3]);
    stream.listen((count) {
      expect(count, inInclusiveRange(1, 3));
    });
  });
}
