import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

main() {
  TestClass mocking = MockingTestClass();
  test("mocking then return", () {
      when(mocking.noParameterFunction()).thenReturn("mocking");
      expect(mocking.noParameterFunction(), "mocking");
  });

  test("mocking then parameter ",(){
      when(mocking.parameterFunction("A")).thenReturn("mocking");
      expect(mocking.parameterFunction("B"), "mocking");
  });

}

class TestClass {
  noParameterFunction() => "no Parameter test";
  parameterFunction(String s) => "Parameter test";
}

class MockingTestClass extends Mock implements TestClass {}
