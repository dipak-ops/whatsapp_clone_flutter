import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show BuildContext, Column, Image, Scaffold, StatelessWidget, Widget, FloatingActionButtonLocation, MaterialPageRoute;
import 'package:whatsapp_app/screens/Login/loginscreen.dart';
import 'package:whatsapp_app/widgets/uihelper.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/onboardingscreen.png'),
            SizedBox(
              height: 30,
            ),
            UiHelper.CustomText(text: 'Welcome to WhatsApp', height: 20,color:Color(0XFF000000)),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.6,
                    color: Color(0xFF667781),
                  ),
                  children: [
                    TextSpan(text: 'Read our '),
                    TextSpan(
                      text: 'Privacy Policy.',
                      style: TextStyle(
                        color: Color(0xFF25D366),
                      ),
                    ),
                    TextSpan(text: ' Tap "Agree and continue" to accept the '),
                    TextSpan(
                      text: 'Terms of Service.',
                      style: TextStyle(
                        color: Color(0xFF25D366),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: UiHelper.CustomButtom(
          callBack: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder:(contex)=>LoginScreen())
            );
          },
          buttonname: "Agree and continue"
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}