import 'package:flutter/material.dart';

class Functions {

  List <TextSpan> antibioticHighlighter (String mainText, double fontSize)
  {
    List<TextSpan> children = [];
    List<String> words = mainText.split(" ");

    for (int i = 0; i < words.length; i++) {
      if (words[i].toLowerCase() == "flucloxacillin"||
          words[i].toLowerCase() == "amoxicillin"||
          words[i].toLowerCase() == "red"||
          words[i].toLowerCase() == "co-amoxiclav"||
          words[i].toLowerCase() == "piperacillin-tazobactam"||
          words[i].toLowerCase() =="pivmecillinam"||
          words[i].toLowerCase() =="phenoxymethylpenicillin"||
          words[i].toLowerCase() =="benzylpenicillin")


      {
        children.add(
            TextSpan(
              text: (words[i] + ' '),
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
                fontSize: fontSize,
              ),
            ));
      }
      else if (words[i].toLowerCase() == ("ceftriaxone")||
          words[i].toLowerCase() == "amber"||
          words[i].toLowerCase() == "meropenem"||
          words[i].toLowerCase() == "ceftazidime"||
          words[i].toLowerCase() == "cefalexin"||
          words[i].toLowerCase() == "cefotaxime") {
        children.add(
            TextSpan(
              text: (words[i] + ' '),
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.w600,
                fontSize: fontSize,
              ),
            ));
      }
      else if (words[i].toLowerCase() == "green"||
          words[i].toLowerCase() == "gentamicin"||
          words[i].toLowerCase() =="vancomycin"||
          words[i].toLowerCase() =="teicoplanin"||
          words[i].toLowerCase() =="rifampicin"||
          words[i].toLowerCase() =="chloramphenicol"||
          words[i].toLowerCase() =="co-trimoxazole"||
          words[i].toLowerCase() =="aciclovir" ||
          words[i].toLowerCase() =="metronidazole"||
          words[i].toLowerCase() =="ciprofloxacin"||
          words[i].toLowerCase() =="levofloxacin"||
          words[i].toLowerCase() =="doxycycline"||
          words[i].toLowerCase() =="clarithromycin"||
          words[i].toLowerCase() =="linezolid"||
          words[i].toLowerCase() =="clindamycin"||
          words[i].toLowerCase() =="fosfomycin" ||
          words[i].toLowerCase() =="nitrofurantoin"||
          words[i].toLowerCase() =="trimethoprim"||
          words[i].toLowerCase() =="amikacin"||
          words[i].toLowerCase() =="erythromycin"||
          words[i].toLowerCase() =="oxytetracycline"||
          words[i].toLowerCase() =="ofloxacin" ||
          words[i].toLowerCase() =="chlorhexidine" ||
          words[i].toLowerCase() =="hydrogen" ||
          words[i].toLowerCase() =="peroxide"||
          words[i].toLowerCase() =="fusidic"||
          words[i].toLowerCase() =="acid"||
          words[i].toLowerCase() =="fidaxomicin"||
          words[i].toLowerCase() =="tetracycline"||
          words[i].toLowerCase() =="hydrochloride"||
          words[i].toLowerCase() =="tinidazole"||
          words[i].toLowerCase() =="miconazole"||
          words[i].toLowerCase() =="nystatin"||
          words[i].toLowerCase() =="fluconazole"||
          words[i].toLowerCase() =="mebendazole"||
          words[i].toLowerCase() =="azithromycin"||
          words[i].toLowerCase() =="valaciclovir"||
          words[i].toLowerCase() =="famciclovir"||
          words[i].toLowerCase() =="terbinafine"||
          words[i].toLowerCase() =="itraconazole"||
          words[i].toLowerCase() =="imidazole"||
          words[i].toLowerCase() =="clotrimazole"||
          words[i].toLowerCase() =="mupirocin"||
          words[i].toLowerCase() =="gluconate"||
          words[i].toLowerCase() =="permethrin"||
          words[i].toLowerCase() =="malathion"||
          words[i].toLowerCase() =="acetic"||
          words[i].toLowerCase() =="sulfate" ||
          words[i].toLowerCase() =="neomycin"||
          words[i].toLowerCase() =="oseltamivir"
      )
      {
        children.add(
            TextSpan(
              text: (words[i] + ' '),
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w600,
                fontSize: fontSize,
              ),
            ));
      }
      else {
        children.add(
            TextSpan(
              text: (words[i] + ' '),
              style: TextStyle(
                color: Colors.black,
                fontSize: fontSize,
              ),
            ));
      }
    }
    return children;
  }

  double idealBodyWeight (String inputHeight, String inputWeight, int? isMale){

    double idealBodyWeight;
    double usedBodyWeight;

    print("This is the input weight " +inputWeight);

    if(isMale == 0)
    {
      idealBodyWeight = 50 + (double.parse(inputHeight)-152);
      print('£££ $idealBodyWeight');

      if(idealBodyWeight < 50)
      {
        idealBodyWeight = 50;
      }

      else
      {

      }

    }

    else
    {
      idealBodyWeight = 45 + (double.parse(inputHeight)-152);

      if(idealBodyWeight < 45)
      {
        idealBodyWeight = 45;
      }

      else
      {

      }

    }

    if (double.parse(inputWeight)>=(idealBodyWeight*1.2))
    {
      usedBodyWeight = idealBodyWeight;
    }

    else
    {
      usedBodyWeight = double.parse(inputWeight);
    }

    return usedBodyWeight;


  }


  double creatinineClearance(String inputCreatinine, double usedBodyWeight, String inputAge, int? isMale){

    double creatinineClearance;
    double n;

    if (isMale == 0)
    {
      n = 1.23;
    }

    else
    {
      n = 1.04;
    }


    creatinineClearance = (n*((140-double.parse(inputAge))*usedBodyWeight))/double.parse(inputCreatinine);
    print(creatinineClearance);
    return creatinineClearance;
  }

  double rounding (double roundTo, double inputDose)
  {
    double finalDose = 0;
    print(inputDose);

    if (inputDose%roundTo == 0)
      {
        finalDose = inputDose;

      }
    else if(inputDose%roundTo >= roundTo/2)
      {
        finalDose = inputDose - (inputDose%roundTo) + roundTo;
      }
    else if(inputDose%roundTo < roundTo/2)
      {
        finalDose = inputDose - (inputDose%roundTo) - roundTo;
      }
    else
      {

      }

    return finalDose;
  }





}