import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_app/widgets/uihelper.dart';
import 'package:pinput/pinput.dart';

import '../ProfileInfo/profileinfo.dart' show ProfileInfo;

class OTPScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 85,
          ),
          Center(
            child: UiHelper.CustomText(text: 'Verifying your number', height: 20,color: Color(0xFF00A884),fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: UiHelper.CustomText(text: 'You’ve tried to register +911234567890', height: 16,),
          ),
          SizedBox(
            height: 2.5,
          ),
          Center(
            child: UiHelper.CustomText(text: 'recently. Wait before requesting an sms or a call.', height: 16,),
          ),
          SizedBox(
            height: 2.5,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16,
                ),
                children: [
                  TextSpan(text: "with your code. ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0XFF5E5E5E),
                      )
                  ),
                  TextSpan(
                    text: "Wrong number?",
                    style: TextStyle(
                      color: Color(0xFF00A884),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Pinput(
            length: 6,
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: UiHelper.CustomText(text: 'Didn’t receive code?', height: 16,color: Color(0xFF00A884)),
          ),
        ],
      ),
      floatingActionButton: UiHelper.CustomButtom(
          callBack: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return  ProfileInfo();
                },
              ),
            );
          },
          buttonname: "Next"
      ),
      floatingActionButtonLocation:  FloatingActionButtonLocation.centerFloat,
    );
  }
}