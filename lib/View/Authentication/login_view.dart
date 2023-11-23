import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_socialaccounts/View/Authentication/login_vm.dart';
import 'package:login_socialaccounts/View/Facebook/facebook_view.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final devicWidth = MediaQuery.of(context).size.width;
    final devicHeight = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
  create: (BuildContext context) => LoginVm(context),
  child: Scaffold(
        body: Consumer<LoginVm>(
  builder: (context, loginVm, child) {
  return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              //color: Colors.blue,
              height: devicHeight * 0.40,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromRGBO(47, 156, 245, 1.0),
                    Color.fromRGBO(167, 199, 225, 1.0),
                  ],

                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0), // Adjust the radius as needed
                  bottomRight: Radius.circular(20.0), // Adjust the radius as needed
                ),
              ),
              child: Container(child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 220),
                    child: Text('Social  Login', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
                  ),
                ],
              ),),
            ),
            SizedBox(height: devicHeight * 0.09,),
            Center(
              child: ElevatedButton(
                child: Container(
                    width: 200,
                    height: 35,
                    child: Row(
                      children: [
                        Image.asset('assets/images/googleicon.png', height: 25,),
                        //Icon(Icons.email_rounded, color: Colors.black54,),
                        SizedBox(width: devicWidth * 0.05,),
                        Text('Continue with Google', style: TextStyle(color: Colors.black54, fontSize: 13),),
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

                  // FirebaseFirestore.instance
                  //     .collection('Users').doc().set({
                  //   'name' : 'Testing'
                  // }).then((value) {
                  //   print('done');
                  // });
                  loginVm.signInGoogle();
                },
              ),

            ),
            SizedBox(height: 20,),
            ElevatedButton(
              child: Container(
                  width: 200,
                  height: 35,
                  child: Row(
                    children: [
                      Image.asset('assets/images/fbicon.png', height: 28,),
                      //Icon(Icons.email_rounded, color: Colors.black54,),
                      SizedBox(width: devicWidth * 0.05,),
                      Text('Continue with Facebook', style: TextStyle(color: Colors.black54, fontSize: 13),),
                    ],
                  )),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: ()  {

                 loginVm.signInWithFacebook();
              },
            ),
          ],
        );
  },
),
      ),
);
  }
}


