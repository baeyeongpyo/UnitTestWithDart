class Calcul {

  static RegExp numberReg = RegExp("[0-9]");
  static RegExp mathSymbolReg = RegExp("[+\\-*/]");

  int cal(String calculString) {
    List<int> numberList = List<int>();
    List<String> mathSymbol = List<String>();

    String tempString = "";

    calculString.split("").forEach((s) {
      if ( numberReg.hasMatch(s) ){
        tempString += s;
      }else if(mathSymbolReg.hasMatch(s)){
        numberList.add(int.parse(tempString));
        mathSymbol.add(s);
        tempString = "";
      }

      print("numberList : $numberList , mathSymbol : $mathSymbol");

    });
  }
}
