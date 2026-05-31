import 'package:flutter/material.dart';
import 'package:whatsapp_app/widgets/uihelper.dart';

import '../OTP/otpscreen.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedCountry='India';

  List<String> countries=[
    'India',
    'United States',
    'Canada',
    'Australia',
    'United Kingdom',
    'Germany',
    'France',
    'Japan',
    'China',
    'Brazil',
    'Russia',
    'South Africa',
    'Italy',
    'Spain',
    'Mexico',
    'Singapore',
    'New Zealand',
    'Pakistan',
    'Bangladesh',
    'Nepal',
    'Sri Lanka',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 85,
          ),
          Center(
            child: UiHelper.CustomText(text: 'Enter your phone number', height: 20,color: Color(0xFF00A884),fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          UiHelper.CustomText(text: 'WhatsApp will need to verify your phone ', height: 16),
          SizedBox(
            height: 2.5,
          ),
          UiHelper.CustomText(text: 'number. Carrier charges may apply.', height: 16),
          SizedBox(
            height: 2.5,
          ),
          UiHelper.CustomText(text: ' What’s my number?', height: 16,color: Color(0xFF00A884)),
          SizedBox(
            height:90 ,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: DropdownButtonFormField<String>(
              value: selectedCountry,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                ),
                items: countries.map((country){
                  return DropdownMenuItem(
                    value: country,
                      child: Text(country),
                  );
                }).toList(),
                onChanged: (val){
                setState(() {

                  selectedCountry=val!;
                });
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                SizedBox(
                  width: 60,
                  child: TextFormField(
                    initialValue: '+91',
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF25D366),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF25D366),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
                      return  OTPScreen();
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