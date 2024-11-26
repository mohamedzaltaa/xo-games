
import 'package:flutter/material.dart';
import 'package:frist_ap/button.dart';
import 'package:frist_ap/player.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int player1 = 0;
  int player2 = 0;
  List<String> boardState = ['', '', '', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    playerData arg = ModalRoute.of(context)?.settings.arguments as playerData;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "X_O GAME",
          style: TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold, color: Colors.green),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${arg.player1Name} (X)", style: TextStyle(fontSize: 25,color: Colors.green)),
                      Text("$player1", style: TextStyle(fontSize: 25))
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${arg.player2Name}(O)",
                        style: TextStyle(fontSize: 25,color: Colors.green),
                      ),
                      Text("$player2", style: TextStyle(fontSize: 25,))
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BoardButton(boardState[0], 0, onClickChange),
                    BoardButton(boardState[1], 1, onClickChange),
                    BoardButton(boardState[2], 2, onClickChange),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoardButton(boardState[3], 3, onClickChange),
                  BoardButton(boardState[4], 4, onClickChange),
                  BoardButton(boardState[5], 5, onClickChange),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoardButton(boardState[6], 6, onClickChange),
                  BoardButton(boardState[7], 7, onClickChange),
                  BoardButton(boardState[8], 8, onClickChange),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int counter = 0;

  void onClickChange(int index) {
    if (boardState[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
  
      boardState[index] = 'X';
    } else {
     
      boardState[index] = 'O';
    }
    if (winnerCheck("X")) {
      intialBoard();
      player1 += 5;
    } else if (winnerCheck("O")) {
      intialBoard();
      player2 += 5;
    }
    counter++;
    setState(() {});
  }

  bool winnerCheck(String symbol) {
    for (int i = 0; i < 9; i += 3) {
     
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
     
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
      }
    }
    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    }
    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    }

    return false;
  }

  void intialBoard() {
    boardState = ['', '', '', '', '', '', '', '', ''];
    counter = 0;

    setState(() {});
  }
}