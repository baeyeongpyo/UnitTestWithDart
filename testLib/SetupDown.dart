import 'package:test/test.dart';

main(List<String> args) {
  var tempName;

  test("test1", () {
    expect(tempName, "ABC");
  });

  tearDown(() {});

  setUp(() {
    tempName = "ABC";
  });
}
