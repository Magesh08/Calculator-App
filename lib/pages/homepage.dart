import 'package:flutter/material.dart';
import 'package:calculator/models/button_model.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var userQuestion = '';
  var userAnswer = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    '00',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 1,
              color: Colors.blueGrey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 30),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userQuestion,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )),
                  Container(
                      padding: EdgeInsets.only(right: 30),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userAnswer,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ))
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              color: Colors.blueGrey,
              padding: EdgeInsets.all(10.0),
              child: buildButtonGrid(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButtonGrid() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: buttons.length,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return MyButtons(
            color: Colors.green,
            textColor: Colors.white,
            buttonText: buttons[index],
            buttontapped: () {
              setState(() {
                userQuestion = '';
                userAnswer = '';
              });
            },
          );
        }
        if (index == 1) {
          return MyButtons(
            color: Colors.red,
            textColor: Colors.white,
            buttonText: buttons[index],
            buttontapped: () {
              setState(() {
                userQuestion =
                    userQuestion.substring(0, userQuestion.length - 1);
              });
            },
          );
        } else if (index == buttons.length - 1) {
          return MyButtons(
            color: Colors.green,
            textColor: Colors.white,
            buttonText: buttons[index],
            buttontapped: () {
              setState(() {
                equalprassed();
              });
            },
          );
        } else {
          return MyButtons(
            buttontapped: () {
              // Define the function to execute when the button is tapped
              setState(() {
                userQuestion += buttons[index];
              });
            },
            color: isOperatorSymbol(buttons[index])
                ? Color.fromARGB(255, 65, 224, 190)
                : Color.fromARGB(255, 167, 167, 164),
            textColor: Colors.white,
            buttonText: buttons[index],
          );
        }
      },
    );
  }

  bool isOperatorSymbol(String x) {
    return ['%', '/', '-', '+', 'x', '='].contains(x);
  }

  void equalprassed() {
    try {
      String finalQuestion =
          userQuestion.replaceAll(',', ''); // Remove commas for calculation
      finalQuestion = finalQuestion.replaceAll('x', '*');

      Parser p = Parser();
      Expression exp = p.parse(finalQuestion);

      // Bind variables:
      ContextModel cm = ContextModel();

      // Evaluate expression:
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      // Format the answer with commas
      NumberFormat formatter = NumberFormat("#,###");
      userAnswer = formatter.format(eval);
    } catch (e) {
      // Handle the error, e.g., by providing feedback to the user
      print('Error: $e');
      userAnswer = 'Invalid expression';
    }
  }
}
