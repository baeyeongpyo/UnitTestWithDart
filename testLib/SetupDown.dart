import 'package:test/test.dart';

main() {
  var tempName;

  test("test1", () {
    expect(tempName, "ABC");
  });

  tearDown(() {});

  setUp(() {
    tempName = "ABC";
  });
}
