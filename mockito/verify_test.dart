import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

main() {
  test("verify test", () {
    VerifyTestClassMocking mocking = VerifyTestClassMocking();
    mocking.printTest();
    verify(mocking.printTest()).called(1);
  });
}

class VertifyTestClass {
  printTest() => printVerify();

  printVerify() => print("test print");
}

class VerifyTestClassMocking extends Mock implements VertifyTestClass {}
