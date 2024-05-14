import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoy/common/constant.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool onTurn = true; // the first player is O!
  List<String> displayExOh = ['', '', '', '', '', '', '', '', ''];

  int ohScore = 0;
  int xhScore = 0;
  int fillBoxes = 0;
  int currentGame = 1;
  int totalGames = 1; // Default to 1 game

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.homeBackground,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0,left: 30,right: 30),
                        child: DropdownButtonFormField<int>(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none
                              )),
                          dropdownColor: Constants.homeBackground,
                          value: totalGames,
                          items: [1, 3, 5, 7].map((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text('$value Games',
                                  style: Constants.myNewFontWhite),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              totalGames = value!;
                              currentGame = 1;
                              ohScore = 0;
                              xhScore = 0;
                              _clearBoard();
                            });
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30.0,
                                left: 25.0,
                                right: 25.0,
                                bottom: 30.0),
                            child: Column(
                              children: [
                                Text('Player X',
                                    style: Constants.myNewFontWhite),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(xhScore.toString(),
                                    style: Constants.myNewFontWhite),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30.0,
                                left: 25.0,
                                right: 25.0,
                                bottom: 30.0),
                            child: Column(
                              children: [
                                Text('Player O',
                                    style: Constants.myNewFontWhite),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(ohScore.toString(),
                                    style: Constants.myNewFontWhite),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Constants.border)),
                        child: Center(
                          child: Text(
                            displayExOh[index],
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (onTurn && displayExOh[index] == '') {
        displayExOh[index] = 'O';
        fillBoxes += 1;
      } else if (!onTurn && displayExOh[index] == '') {
        displayExOh[index] = 'X';
        fillBoxes += 1;
      }

      onTurn = !onTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    bool winnerFound = false;
    // Check 1st row
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      winnerFound = true;
      _showWinDialog(displayExOh[0]);
    }

    // Check 1st column
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      winnerFound = true;
      _showWinDialog(displayExOh[0]);
    }

    // Check diagonal
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      winnerFound = true;
      _showWinDialog(displayExOh[0]);
    }

    // Check 2nd column
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      winnerFound = true;
      _showWinDialog(displayExOh[1]);
    }

    // Check 3rd column
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      winnerFound = true;
      _showWinDialog(displayExOh[2]);
    }

    // Check 2nd row
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      winnerFound = true;
      _showWinDialog(displayExOh[3]);
    }

    // Check 3rd row
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      winnerFound = true;
      _showWinDialog(displayExOh[6]);
    }

    // Check reverse diagonal
    if (displayExOh[2] == displayExOh[4] &&
        displayExOh[2] == displayExOh[6] &&
        displayExOh[2] != '') {
      winnerFound = true;
      _showWinDialog(displayExOh[2]);
    }

    //if no one wins the game
    else if (!winnerFound && fillBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Draw',
            style: TextStyle(fontSize: 30),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
              child: const Text(
                'Play Again!',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showWinDialog(String winner) {
    if (winner == 'O') {
      ohScore += 1;
    } else if (winner == 'X') {
      xhScore += 1;
    }

    if (_checkEarlyWin()) {
      _showOverallWinner();
    } else {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Winner is: $winner'),
            actions: [
              TextButton(
                onPressed: () {
                  if (currentGame < totalGames) {
                    _clearBoard();
                    setState(() {
                      currentGame += 1;
                    });
                  } else {
                    _showOverallWinner();
                  }
                  Navigator.of(context).pop();
                },
                child: const Text('Next Game!'),
              ),
            ],
          );
        },
      );
    }
  }

  void _showOverallWinner() {
    String overallWinner;
    if (ohScore > xhScore) {
      overallWinner = 'O';
    } else if (xhScore > ohScore) {
      overallWinner = 'X';
    } else {
      overallWinner = 'No one';
    }

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Overall Winner is: $overallWinner',
            style: TextStyle(fontSize: 30),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _clearBoard();
                setState(() {
                  ohScore = 0;
                  xhScore = 0;
                  currentGame = 1;
                });
                Navigator.of(context).pop();
              },
              child: const Text(
                'Play Again!',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        );
      },
    );
  }

  bool _checkEarlyWin() {
    int gamesToWin = (totalGames / 2).ceil();
    return (ohScore >= gamesToWin || xhScore >= gamesToWin);
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayExOh[i] = '';
      }
      fillBoxes = 0;
      onTurn = true; // Reset the turn to the starting player
    });
  }
}
