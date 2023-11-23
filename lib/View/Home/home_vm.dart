
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_socialaccounts/View/Authentication/login_view.dart';
import 'package:provider/provider.dart';

class HomeVm extends ChangeNotifier {

  bool _isLoading = false;
  bool _isLoggedIn = false;
  String _userName = '';
  String _userProfile = '';
  late BuildContext context;

  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;
  String get userName => _userName;
  String get userProfile => _userProfile;


  HomeVm(this.context);

  setIsLoading(bool status) {
    _isLoading = status;
    notifyListeners();
  }

  signOut() async {
    await FirebaseAuth.instance.signOut().whenComplete(() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) =>  LoginView()));
    });

  }


}