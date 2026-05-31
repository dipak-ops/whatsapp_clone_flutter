import 'package:flutter/material.dart';

class UiHelper{
  static CustomButtom({required VoidCallback callBack,required buttonname}){
    return SizedBox(
      height: 45,
      width: 350,
      child: ElevatedButton(
          onPressed: (){
            callBack();
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          child: Text(buttonname,style: TextStyle(fontSize: 14,color: Colors.white),)
      ),
    );
  }

  static CustomText({required String text,required double height,Color? color,FontWeight? fontWeight}){
    return Text(text,style: TextStyle(fontSize: height,color: color??Color(0XFF5E5E5E),fontWeight:fontWeight),);
  }
}