import 'package:test/test.dart';

main() {
  
  test("test 1", () {
    expect(true, equals(false));
  }, skip: "test 1 skip");
  test("test 2", () {
    expect(true, equals(true));
  });
  test("test 3", () {
    expect(true, equals(true));
  });
}