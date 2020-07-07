import 'package:test/test.dart';

@Tags(const ["chrom"])
main() {
  test("tag chrom", () {}, tags: "chrom");

  test("tag explor", () {}, tags: "explor");

  test("tag window", () {}, tags: "window");
}

// pub run test testLib/Tags.dart --exclude-tags "chrom"
// pub run test testLib/Tags.dart --exclude-tags "(chrom || explor)"
