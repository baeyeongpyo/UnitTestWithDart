@Timeout(const Duration(seconds: 3))
import 'package:test/test.dart';

main() {
  test("time out Test", () async {
    await Future.delayed(Duration(minutes: 2));
  }, timeout: Timeout(Duration(seconds: 10)));
}
