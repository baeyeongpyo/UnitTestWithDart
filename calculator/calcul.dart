import 'calculator.dart';

class Calcul {
  static RegExp numberReg = RegExp("[0-9]");
  static RegExp mathSymbolReg = RegExp("[+\\-*/]");

  int cal(String calculString) {
    List<int> numberList = List<int>();
    List<String> mathSymbol = List<String>();

    String tempString = "";

    calculString.split("").forEach((s) {
      if (numberReg.hasMatch(s)) {
        tempString += s;
      } else if (mathSymbolReg.hasMatch(s)) {
        numberList.add(int.parse(tempString));
        mathSymbol.add(s);
        tempString = "";
      }
    });
    if (tempString.isNotEmpty) {
      numberList.add(int.parse(tempString));
    }

    return mathListCal(numberList, mathSymbol);
  }

  int mathListCal(List<int> numberList, List<String> mathSymbol) {
    int positionCount = 0;
    int calResult = numberList[positionCount++];
    Calculator calculator = Calculator();
    mathSymbol.forEach((symbol) {
      calResult = symbolCal(calculator, symbol, calResult, numberList[positionCount++]);
    });
    return calResult;
  }

  int symbolCal(Calculator calculator, String symbol, int a, int b) {
    int result = 0;
    if (symbol == '+') {
      result = calculator.sum(a, b);
    } else if (symbol == '-') {
      result = calculator.min(a, b);
    } else if (symbol == '*') {
      result = calculator.mul(a, b);
    } else if (symbol == '/') {
      result = calculator.div(a, b);
    }
    return result;
  }
}
