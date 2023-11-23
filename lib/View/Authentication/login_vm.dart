import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_socialaccounts/Model/user_model.dart';
import 'package:login_socialaccounts/View/Facebook/facebook_view.dart';
import 'package:login_socialaccounts/View/Home/home_view.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';


class LoginVm with ChangeNotifier {
  bool _isLoading = false;
  bool _isLoggedIn = false;
  String _userName = '';
  String _userProfile = '';
  late BuildContext context;

  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;
  String get userName => _userName;
  String get userProfile => _userProfile;


  LoginVm(this.context);

  setIsLoading(bool status) {
    _isLoading = status;
    notifyListeners();
  }




  signInGoogle() async {
    signInWithGoogle().then((value) {
      setIsLoading(false);

      if(value.user != null) {
        print(_userName = value.user!.displayName.toString());
        print(_userName = value.user!.displayName.toString());
        _userProfile = value.user!.photoURL.toString();
        final userModel = UserModel(name: _userName, photo: _userProfile);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>  HomeView(userModel: userModel)));
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  HomeView(userModel: userModel)), (route) => false);

      } else {
        print('Error while login with google');
      }
    });
  }




  Future<UserCredential> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status == LoginStatus.success) {
        final AccessToken accessToken = loginResult.accessToken!;
        final OAuthCredential credential = FacebookAuthProvider.credential(accessToken.token);
        return await FirebaseAuth.instance.signInWithCredential(credential);
      } else {
        throw FirebaseAuthException(
          code: 'Facebook Login Failed',
          message: 'The Facebook login was not successful.',
        );
      }
    } on FirebaseAuthException catch (e) {
      // Handle Firebase authentication exceptions
      print('Firebase Auth Exception: ${e.message}');
      throw e; // rethrow the exception
    } catch (e) {
      // Handle other exceptions
      print('Other Exception: $e');
      throw e; // rethrow the exception
    }
  }

  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //
  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //
  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential




    return await FirebaseAuth.instance.signInWithCredential(credential);


  }
