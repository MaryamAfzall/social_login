import 'package:flutter/material.dart';
import 'package:login_socialaccounts/Model/user_model.dart';
import 'package:login_socialaccounts/View/Home/home_vm.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  final UserModel userModel;
  const HomeView({super.key, required this.userModel,});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeVm(context),
      child: Consumer<HomeVm>(
        builder: (context, vm, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: deviceWidth,
                  child: Container(
                    // alignment: Alignment.center,
                    width: deviceWidth*0.8,
                    child: Center(
                      //
                      child: Text( 'Google Login' '!', style: TextStyle(
                          fontSize:25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.025,
                ),
                Card(
                  elevation: 2,
                  child: GestureDetector(
                    onTap: (){

                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: 50,
                        width: deviceWidth*0.9,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: deviceWidth*0.15,
                              child: Center(
                                child: Image.network(userModel.photo, fit: BoxFit.scaleDown,

                                  height: 25,
                                ),
                              ),
                            ),
                            Container(
                                width: deviceWidth*0.65,
                                child: Center(child: Text(userModel.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),)))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
