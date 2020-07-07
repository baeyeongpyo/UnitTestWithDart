import 'package:test/test.dart';

main() {
  test("number Test", () {
    expect(10, equals(10));
  });
  test("String Test", () {
    expect("ABC", equals("ABC"));
  });
  test("List Test", () {
    List<String> list = ["AB", "CD", "EF"];
    expect(list, equals(["AB", "CD", "EF"]));
  });

  test("String Test Fail", () {
    expect("ABC", equals("ABCD"));
  });
}
