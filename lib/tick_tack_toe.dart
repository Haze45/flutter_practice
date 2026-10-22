import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TickTackToe extends StatefulWidget {
  const TickTackToe({super.key});

  @override
  State<TickTackToe> createState() => _TickTackToeState();
}

class _TickTackToeState extends State<TickTackToe> {
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  bool onTurn = true; // true = O's turn, false = X's turn
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;

  static final myNewFontWhite = GoogleFonts.pressStart2p(
    textStyle: const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Player X', style: myNewFontWhite),
                      const SizedBox(height: 20),
                      Text(xScore.toString(), style: myNewFontWhite),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Player O', style: myNewFontWhite),
                      const SizedBox(height: 20),
                      Text(oScore.toString(), style: myNewFontWhite),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => _tapped(index),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[700]!),
                    ),
                    child: Center(
                      child: Text(
                        displayXO[index],
                        style: const TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                children: [
                  Text('Tic Tac Toe', style: myNewFontWhite),
                  const SizedBox(height: 60),
                  Text('@CreatedByAditya', style: myNewFontWhite),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    if (displayXO[index] != '') return;

    setState(() {
      if (onTurn) {
        displayXO[index] = 'O';
      } else {
        displayXO[index] = 'X';
      }
      filledBoxes += 1;
      onTurn = !onTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    const winningCombos = [
      [0, 1, 2], // Row 1
      [3, 4, 5], // Row 2
      [6, 7, 8], // Row 3
      [0, 3, 6], // Col 1
      [1, 4, 7], // Col 2
      [2, 5, 8], // Col 3
      [0, 4, 8], // Diagonal 1
      [2, 4, 6], // Diagonal 2
    ];

    for (var combo in winningCombos) {
      String first = displayXO[combo[0]];
      if (first != '' &&
          first == displayXO[combo[1]] &&
          first == displayXO[combo[2]]) {
        _showWinDialog(first);
        return;
      }
    }

    if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showWinDialog(String winner) {
    setState(() {
      if (winner == 'O') {
        oScore += 1;
      } else if (winner == 'X') {
        xScore += 1;
      }
    });

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("WINNER IS $winner"),
          actions: [
            TextButton(
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
              child: const Text('Play Again!'),
            )
          ],
        );
      },
    );
  }

  void _showDrawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Draw"),
          actions: [
            TextButton(
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
              child: const Text('Play Again!'),
            )
          ],
        );
      },
    );
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
      filledBoxes = 0;
    });
  }
}
