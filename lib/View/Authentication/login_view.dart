import 'package:flutter/material.dart';
import 'package:login_socialaccounts/Components/login_button.dart';
import 'package:login_socialaccounts/View/Authentication/login_vm.dart';
import 'package:provider/provider.dart';


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
              height: devicHeight * 0.45,
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
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Container(child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 270),
                    child: Text('Social  Login', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
                  ),
                ],
              ),),
            ),
            SizedBox(height: devicHeight * 0.09,),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Container(
                height: devicHeight * 0.1,
                child: LoginButton(index: 0, onPress:(){
                  loginVm.signInGoogle();
                },),
              ),
            ),
            //const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Container(
                height: devicHeight * 0.1,
                child: LoginButton(index: 1, onPress:(){
                  loginVm.signInWithFacebook();
                },),
              ),
            ),
          ],
        );
  },
),
      ),
);
  }
}


