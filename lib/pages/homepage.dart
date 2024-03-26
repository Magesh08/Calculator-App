import 'package:flutter/material.dart';
import 'package:calculator/models/button_model.dart'; // Import the MyButtons widget

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
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
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.blueGrey,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: buildButtonGrid(),
              ),
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
        return MyButtons(
          color: isOperatorSymbol(buttons[index])
              ? Colors.deepOrange
              : Colors.yellow,
          textColor: Colors.white,
          buttonText: buttons[index],
        );
      },
    );
  }

  bool isOperatorSymbol(String x) {
    return ['%', '/', '-', '+', '*', '='].contains(x);
  }
}
