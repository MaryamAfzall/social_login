import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_socialaccounts/Model/user_model.dart';
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
      print('Firebase Auth Exception: ${e.message}');
      throw e; // rethrow the exception
    } catch (e) {
      print('Other Exception: $e');
      throw e;
    }
  }

  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);


  }
