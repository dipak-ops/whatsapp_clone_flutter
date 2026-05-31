import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_app/main.dart';
import 'package:whatsapp_app/widgets/uihelper.dart';

class ProfileInfo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 85,
          ),
          Center(
            child:  UiHelper.CustomText(text: 'Verifying your number', height: 20,color: Color(0xFF00A884),fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: UiHelper.CustomText(text: 'Please provide your name and an optional', height: 16),
          ),
          SizedBox(
            height: 2.5,
          ),
          Center(
            child: UiHelper.CustomText(text:'profile photo' , height: 16),
          ),
          SizedBox(
            height: 60,
          ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/Ellipse 1.png'),
            radius: 60,
            child: Icon(Icons.camera_alt,size: 35,),
          ),
          SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type your name here',
                suffixIcon: Icon(
                  Icons.sentiment_satisfied_alt_outlined,
                  color: Colors.grey,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF25D366),
                    width: 1.5,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF25D366),
                    width: 2,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: UiHelper.CustomButtom(
          callBack: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return  MyHomePage();
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