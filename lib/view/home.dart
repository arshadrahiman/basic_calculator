import 'package:basic_calculator/calculation/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userInput = '';
  String answer = '';
  List<dynamic> buttons = [
    'C',
    'D',
    '%',
    '÷',
    '1',
    '2',
    '3',
    'x',
    '4',
    '5',
    '6',
    '-',
    '7',
    '8',
    '9',
    '+',
    '00',
    '0',
    '.',
    '='
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
            Expanded(
            flex: 1,
            child: Container(
              color: const Color(0xffF0EEEE),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (answer != '')
                        Text(
                          userInput,
                          style: const TextStyle(
                              fontSize: 32, color: Color(0xff666666)),
                          textAlign: TextAlign.right,
                        ),
                      Text(
                        answer != '' ? answer : userInput,
                        style: const TextStyle(
                            fontSize: 48, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.right,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: GridView.count(
                padding: const EdgeInsets.all(12),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                crossAxisCount: 4,
                children: buttons
                    .map((text) => MyButton(
                          text: text,
                          onTap: () {
                            if (text == 'C') {
                              setState(() {
                                userInput = '';
                                answer = '';
                              });
                            } else if (text == 'D') {
                              setState(() {
                                userInput = userInput.substring(
                                    0, userInput.length - 1);
                              });
                            } else if (text == '=') {
                              calculate();
                            } else {
                              setState(() {
                                userInput += text;
                              });
                            }
                          },
                        ))
                    .toList(),
              ))
        ],
      ),

    );
  }

  void calculate() {
    String userInputToCalculate = userInput;
    userInputToCalculate = userInputToCalculate.replaceAll('x', '*');
    userInputToCalculate = userInputToCalculate.replaceAll('÷', '/');

    Parser p = Parser();
    Expression exp = p.parse(userInputToCalculate);

    ContextModel cm = ContextModel();

    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      answer = eval.toString();
      if (answer.substring(answer.length - 2, answer.length) == '.0') {
        answer = answer.substring(0, answer.length - 2);
      }
    });
  }
}
