
import 'package:flutter/material.dart';
import 'package:frist_ap/player.dart';
import 'package:frist_ap/screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = 'welcome_screen';
  String player1Name = '';
  String player2Name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'WELCOME TO X_O GAME',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                player1Name = value;
              },
              decoration: InputDecoration(
                hintText: 'ENTER PLAYER NAME 1',
              ),
            ),
            TextField(
              onChanged: (value) {
                player2Name = value;
              },
              decoration: InputDecoration(hintText: "ENTER PLAYER NAME 2"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.routeName,
                   arguments: playerData(player1Name: player1Name, player2Name: player2Name));
                },
                child: Text('START THE GAME',style:TextStyle(color: Colors.black,fontSize:20,fontWeight: FontWeight.bold),))
          ],
        ),
      ),
    );
  }
}