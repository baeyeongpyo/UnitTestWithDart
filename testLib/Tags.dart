import 'package:test/test.dart';

@Tags(const ["chrom"])
main() {
  test("tag chrom", (){
    
  }, tags: "chrom");

  test("tag explor", (){
    
  }, tags: "explor");
}

// pub run test testLib/Tags.dart --exclude-tags "chrom"