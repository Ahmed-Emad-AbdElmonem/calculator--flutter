import 'package:calculator/constants/constants.dart';
import 'package:calculator/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String exp = "";
  String history = "";
  double num1 = 0;
  double num2 = 0;
  String op = "";

  void numClick(String btnTxt) {
    if (btnTxt == "AC") {
      setState(() {
        exp = "";
        history = "";
      });

      num1 = 0;
      num2 = 0;
    } else if (btnTxt == "C") {
      setState(() {
        exp = "";
      });
    } else if (btnTxt == ('+') ||
        btnTxt == ('-') ||
        btnTxt == ('*') ||
        btnTxt == ('/') ||
        btnTxt == ('%')) {
      op = btnTxt;
      num1 = double.parse(exp);
      setState(() {
        exp = "";
        history = num1.toString();
        history += btnTxt;
      });
    } else if (btnTxt == ".") {
      if (exp.contains('.')) {
      } else {
        setState(() {
          exp += btnTxt;
        });
      }
    } else if (btnTxt == "=") {
      num2 = double.parse(exp);
      history += exp;

      switch (op) {
        case '+':
          {
            exp = (num1 + num2).toString();
          }
          break;

        case '*':
          {
            exp = (num1 * num2).toString();
          }
          break;

        case '-':
          {
            exp = (num1 - num2).toString();
          }
          break;

        case '%':
          {
            exp = (num1 % num2).toString();
          }
          break;

        case '/':
          {
            num2 == 0
                ? exp = "unvalid operation"
                : exp = (num1 / num2).toString();
          }
          break;

        default:
          break;
      }

      setState(() {
        
      });
    } 
    
    else {
      setState(() {
        exp += btnTxt;
      });
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              margin: Constants.txtMargin,
              alignment: Constants.txtAlignment,
              child: Text(history, style: Constants.style1)),
          const Divider(
            color: Colors.yellow,
            thickness: 5,
          ),
          Container(
              margin: Constants.txtMargin,
              alignment: Constants.txtAlignment,
              child: Text(exp, style: Constants.style1)),
          Row(
            children: [
              CusomButton(
                btnColor: Colors.blue,
                btnTxt: "AC",
                flex: 2,
                callBack: numClick,
              ),
              CusomButton(
                btnColor: Colors.yellow,
                btnTxt: "C",
                flex: null,
                callBack: numClick,
              ),
              CusomButton(
                btnColor: Colors.teal,
                btnTxt: "%",
                flex: null,
                callBack: numClick,
              ),
              CusomButton(
                btnColor: Colors.red,
                btnTxt: "/",
                flex: null,
                callBack: numClick,
              ),
            ],
          ),
          Row(
            children: [
              CusomButton(
                btnColor: Colors.blue,
                btnTxt: "7",
                flex: 2,
                callBack: numClick,
              ),
              CusomButton(
                btnColor: Colors.yellow,
                btnTxt: "8",
                flex: null,
                callBack: numClick,
              ),
              CusomButton(
                btnColor: Colors.teal,
                btnTxt: "9",
                flex: null,
                callBack: numClick,
              ),
              CusomButton(
                btnColor: Colors.red,
                btnTxt: "*",
                flex: null,
                callBack: numClick,
              ),
            ],
          ),
          Row(
            children: [
              CusomButton(
                btnColor: Colors.blue,
                btnTxt: "4",
                flex: 2,
                callBack: numClick,
              ),
              CusomButton(
                btnColor: Colors.yellow,
                btnTxt: "5",
                flex: null,
                callBack: numClick,
              ),
              CusomButton(
                btnColor: Colors.teal,
                btnTxt: "6",
                flex: null,
                callBack: numClick,
              ),
              CusomButton(
                btnColor: Colors.red,
                btnTxt: "-",
                flex: null,
                callBack: numClick,
              ),
            ],
          ),
          Row(
            children: [
              CusomButton(
                btnColor: Colors.blue,
                btnTxt: "1",
                flex: 2,
                callBack: numClick,
              ),
              CusomButton(
                btnColor: Colors.yellow,
                btnTxt: "2",
                flex: null,
                callBack: numClick,
              ),
              CusomButton(
                btnColor: Colors.teal,
                btnTxt: "3",
                flex: null,
                callBack: numClick,
              ),
              CusomButton(
                btnColor: Colors.red,
                btnTxt: "+",
                flex: null,
                callBack: numClick,
              ),
            ],
          ),
          Row(
            children: [
              CusomButton(
                btnColor: Colors.blue,
                btnTxt: "0",
                flex: 3,
                callBack: numClick,
              ),
              CusomButton(
                btnColor: Colors.yellow,
                btnTxt: ".",
                flex: null,
                callBack: numClick,
              ),
              CusomButton(
                btnColor: Colors.teal,
                btnTxt: "=",
                flex: null,
                callBack: numClick,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
