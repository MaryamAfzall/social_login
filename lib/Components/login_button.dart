import 'package:flutter/material.dart';
import 'package:login_socialaccounts/Data/button_data.dart';
import 'package:login_socialaccounts/Model/login_model.dart';
class LoginButton extends StatelessWidget {
  int index;
  VoidCallback onPress;
  LoginButton({super.key, required this.index, required this.onPress});


  @override
  Widget build(BuildContext context) {
    final devicWidth = MediaQuery.of(context).size.width;
    final devicHeight = MediaQuery.of(context).size.height;
    LoginModel loginModel = ButtonDummyData.buttonList[index];
    return Scaffold(
      body: ElevatedButton(
        child: Container(
            width: devicWidth * 0.55,
            height: devicHeight * 0.06,
            child: Row(
              children: [
                Image.asset(loginModel.image, height: 25,),
                //Icon(Icons.email_rounded, color: Colors.black54,),
                SizedBox(width: devicWidth * 0.05,),
                Text(loginModel.title, style: TextStyle(color: Colors.black54, fontSize: 13),),
              ],
            )),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () {
          onPress();
        },
      ),
    );
  }
}
