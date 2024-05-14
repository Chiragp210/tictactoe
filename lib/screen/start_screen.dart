import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tictactoy/common/constant.dart';
import 'package:tictactoy/screen/home_page.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Constants.homeBackground,
          body: Column(
            children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.only(top: 108.0,left: 30),
                child: Container(child: Text('TIC TAC TOE',style: Constants.myNewFontWhite.copyWith(fontSize: 30),)),
              )),
              Expanded(flex: 2,child: Container(
                padding: EdgeInsets.only(left: 20),
                child:
              AvatarGlow(
                glowColor: Colors.white,
                duration: Duration(seconds: 2),
                repeat: true,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.none
                    )
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[900],
                    child: Container(
                      child: Image.asset('assets/images/back.png',
                      color: Colors.white,
                      fit: BoxFit.scaleDown,
                      ),
                    ),
                    radius: 80.0,
                  ),
                ),
              ),)),
              Expanded(child: Padding(
                padding: const EdgeInsets.only(top: 108.0,left: 30),
                child: Container(child: Text('Chirag Panchal',style: Constants.myNewFontWhite.copyWith(fontSize: 20),)),
              )),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MyHomePage()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 40,right: 40,bottom: 60),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(30),
                        color: Colors.white,
                        child: Text('PLAY GAME',style: Constants.myNewFont,),

                      ),
                    ),
                  ),
                ),
              )

            ],
          ),
        )
    );
  }
}
