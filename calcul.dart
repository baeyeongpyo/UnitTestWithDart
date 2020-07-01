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
      return mathListCal(numberList, mathSymbol);
    });
  }

  int mathListCal(List<int> numberList, List<String> mathSymbol) {
    Iterator<int> numberIterable = numberList.iterator;
    int calResult = numberIterable.current;
    Calculator calculator = Calculator();
    mathSymbol.forEach((symbol) {
      symbolCal(calculator, symbol, calResult, numberIterable.current);
    });
    return calResult;
  }

  int symbolCal(Calculator calculator,String symbol, int a, int b) {
    int result = 0;
    if (symbol == '+'){
      result = calculator.sum(a, b);
    }else if ( symbol == '-'){
      result = calculator.min(a, b);
    }else if ( symbol == '*'){
      result  = calculator.mul(a, b);
    }else if ( symbol == '/'){
      result = calculator.div(a, b);
    }
    return result;
  }
}
