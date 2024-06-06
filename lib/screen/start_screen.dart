import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tictactoy/common/constant.dart';
import 'package:tictactoy/screen/home_page.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Constants.homeBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.1, left: screenWidth * 0.05),
            child: Text(
              'TIC TAC TOE',
              style: Constants.myNewFontWhite.copyWith(fontSize: 30),
            ),
          )),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: screenWidth * 0.05),
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: Colors.grey[900],
                radius: screenHeight * 0.1,
                child: Image.asset(
                  'assets/images/back.png',
                  color: Colors.white,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.05),
            child: Text(
              'Chirag Panchal',
              style: Constants.myNewFontWhite.copyWith(fontSize: 20),
            ),
          )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage()));
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.1,
                      right: screenWidth * 0.1,
                      bottom: screenHeight * 0.05),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      color: Colors.white,
                      child: Text(
                        'PLAY GAME',
                        style: Constants.myNewFont,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
