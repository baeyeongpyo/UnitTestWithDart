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
      expect(mocking.parameterFunction("A"), "mocking");
  });

  test("mocking then answer ",(){
      when(mocking.futureTest()).thenAnswer((_)=>"mocking");
      expect(mocking.futureTest(), "mocking");
  });

}

class TestClass {
  noParameterFunction() => "no Parameter test";
  parameterFunction(String s) => "Parameter test";
  futureTest() async => Future.value(123);
}

class MockingTestClass extends Mock implements TestClass {}
