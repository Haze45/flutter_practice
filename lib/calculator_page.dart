import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  // What is currently displayed on the calculator
  String display = '0';

  // First number
  double? firstNumber;

  // Selected operator
  String? operator;

  // Whether the next number should start fresh
  bool shouldResetDisplay = false;

  // ============================
  // NUMBER BUTTON
  // ============================

  void enterNumber(String number) {
    setState(() {
      if (display == '0' || shouldResetDisplay) {
        display = number;
        shouldResetDisplay = false;
      } else {
        display += number;
      }
    });
  }

  // ============================
  // DECIMAL BUTTON
  // ============================

  void enterDecimal() {
    setState(() {
      if (shouldResetDisplay) {
        display = '0.';
        shouldResetDisplay = false;
        return;
      }

      if (!display.contains('.')) {
        display += '.';
      }
    });
  }

  // ============================
  // OPERATOR BUTTON
  // ============================

  void selectOperator(String selectedOperator) {
    setState(() {
      firstNumber = double.tryParse(display);

      operator = selectedOperator;

      shouldResetDisplay = true;
    });
  }

  // ============================
  // EQUALS BUTTON
  // ============================

  void calculate() {
    if (firstNumber == null || operator == null) {
      return;
    }

    double? secondNumber = double.tryParse(display);

    if (secondNumber == null) {
      return;
    }

    double result = 0;

    switch (operator) {
      case '+':
        result = firstNumber! + secondNumber;

      case '-':
        result = firstNumber! - secondNumber;

      case '×':
        result = firstNumber! * secondNumber;

      case '÷':
        if (secondNumber == 0) {
          setState(() {
            display = 'Error';
            firstNumber = null;
            operator = null;
            shouldResetDisplay = true;
          });

          return;
        }

        result = firstNumber! / secondNumber;
    }

    setState(() {
      display = formatResult(result);

      firstNumber = null;
      operator = null;
      shouldResetDisplay = true;
    });
  }

  // ============================
  // CLEAR BUTTON
  // ============================

  void clearCalculator() {
    setState(() {
      display = '0';
      firstNumber = null;
      operator = null;
      shouldResetDisplay = false;
    });
  }

  // ============================
  // DELETE BUTTON
  // ============================

  void deleteLastCharacter() {
    setState(() {
      if (display.length > 1) {
        display = display.substring(
          0,
          display.length - 1,
        );
      } else {
        display = '0';
      }
    });
  }

  // ============================
  // FORMAT RESULT
  // ============================

  String formatResult(double result) {
    if (result == result.roundToDouble()) {
      return result.toInt().toString();
    }

    return result.toString();
  }

  // ============================
  // CALCULATOR BUTTON
  // ============================

  Widget calculatorButton({
    required String text,
    required VoidCallback onPressed,
    bool isOperator = false,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6),

        child: ElevatedButton(
          onPressed: onPressed,

          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),

            backgroundColor: isOperator
                ? Colors.deepPurple
                : Colors.grey.shade200,

            foregroundColor: isOperator
                ? Colors.white
                : Colors.black,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),

          child: Text(
            text,

            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),

        child: Column(
          children: [

            // ============================
            // DISPLAY
            // ============================

            Expanded(
              flex: 2,

              child: Container(
                width: double.infinity,

                alignment: Alignment.bottomRight,

                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.black87,

                  borderRadius:
                  BorderRadius.circular(20),
                ),

                child: Text(
                  display,

                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),

                  maxLines: 1,

                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),

            const SizedBox(height: 15),

            // ============================
            // BUTTONS
            // ============================

            Expanded(
              flex: 5,

              child: Column(
                children: [

                  // Row 1
                  Expanded(
                    child: Row(
                      children: [

                        calculatorButton(
                          text: 'C',
                          onPressed: clearCalculator,
                          isOperator: true,
                        ),

                        calculatorButton(
                          text: '⌫',
                          onPressed:
                          deleteLastCharacter,
                        ),

                        calculatorButton(
                          text: '÷',
                          onPressed: () =>
                              selectOperator('÷'),
                          isOperator: true,
                        ),
                      ],
                    ),
                  ),

                  // Row 2
                  Expanded(
                    child: Row(
                      children: [

                        calculatorButton(
                          text: '7',
                          onPressed: () =>
                              enterNumber('7'),
                        ),

                        calculatorButton(
                          text: '8',
                          onPressed: () =>
                              enterNumber('8'),
                        ),

                        calculatorButton(
                          text: '9',
                          onPressed: () =>
                              enterNumber('9'),
                        ),

                        calculatorButton(
                          text: '×',
                          onPressed: () =>
                              selectOperator('×'),
                          isOperator: true,
                        ),
                      ],
                    ),
                  ),

                  // Row 3
                  Expanded(
                    child: Row(
                      children: [

                        calculatorButton(
                          text: '4',
                          onPressed: () =>
                              enterNumber('4'),
                        ),

                        calculatorButton(
                          text: '5',
                          onPressed: () =>
                              enterNumber('5'),
                        ),

                        calculatorButton(
                          text: '6',
                          onPressed: () =>
                              enterNumber('6'),
                        ),

                        calculatorButton(
                          text: '-',
                          onPressed: () =>
                              selectOperator('-'),
                          isOperator: true,
                        ),
                      ],
                    ),
                  ),

                  // Row 4
                  Expanded(
                    child: Row(
                      children: [

                        calculatorButton(
                          text: '1',
                          onPressed: () =>
                              enterNumber('1'),
                        ),

                        calculatorButton(
                          text: '2',
                          onPressed: () =>
                              enterNumber('2'),
                        ),

                        calculatorButton(
                          text: '3',
                          onPressed: () =>
                              enterNumber('3'),
                        ),

                        calculatorButton(
                          text: '+',
                          onPressed: () =>
                              selectOperator('+'),
                          isOperator: true,
                        ),
                      ],
                    ),
                  ),

                  // Row 5
                  Expanded(
                    child: Row(
                      children: [

                        calculatorButton(
                          text: '0',
                          onPressed: () =>
                              enterNumber('0'),
                        ),

                        calculatorButton(
                          text: '.',
                          onPressed: enterDecimal,
                        ),

                        calculatorButton(
                          text: '=',
                          onPressed: calculate,
                          isOperator: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}