import 'package:test/test.dart';

main(List<String> args) {
  
  group("test Group 1", (){
    test("test Group 1 _ test 1", (){
      expect(true, equals(false));
    });
    test("test Group 1 _ test 2", (){
      expect(true, equals(true));
    });
    test("test Group 1 _ test 3", (){
      expect(true, equals(false));
    });
  }, skip: "skip!");

}