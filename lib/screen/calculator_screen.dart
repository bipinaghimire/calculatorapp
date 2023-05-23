import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  var userinput = '';
  final _textController = TextEditingController();
  List<String> buttons = [
    'C',
    '*',
    '/',
    'Del',
    '1',
    '2',
    '3',
    '+',
    '4',
    '5',
    '6',
    '-',
    '7',
    '8',
    '9',
    '*',
    '.',
    '0',
    '%',
    '='
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculator',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextFormField(
              controller: _textController,
              textAlign: TextAlign.end,
              decoration: const InputDecoration(
                hintText: '0',
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                children: [
                  for (int i = 0; i < buttons.length; i++) ...{
                    ElevatedButton(
                      onPressed: () {
                        if (checkIsNumber()) {
                          handleButtonPress(buttons[i]);
                        }
                      },
                      child: Text(
                        buttons[i],
                        style: const TextStyle(
                            color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  }
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  bool checkIsNumber() {
    return true;
  }

  void clearInput() {
    setState(() {
      _textController.text = '';
    });
  }

  void deleteLastCharacter() {
    setState(() {
      final text = _textController.text;
      if (text.isNotEmpty) {
        _textController.text = text.substring(0, text.length - 1);
      }
    });
  }

  void appendToInput(String text) {
    setState(() {
      _textController.text += text;
    });
  }

  void calculate() {
    setState(() {
      final expression = _textController.text;
      if (expression.isNotEmpty) {
        // parser is responsible for the parsing th expression
        final parser = Parser();
        final parsedExpression = parser.parse(expression);
        final context = ContextModel();
        final result = parsedExpression.evaluate(EvaluationType.REAL, context);
        _textController.text = result.toString();
      }
    });
  }

  void handleButtonPress(String buttonText) {
    switch (buttonText) {
      case 'C':
        clearInput();
        break;
      case 'Del':
        deleteLastCharacter();
        break;
      case '=':
        calculate();
        break;
      default:
        appendToInput(buttonText);
        break;
    }
  }
}
