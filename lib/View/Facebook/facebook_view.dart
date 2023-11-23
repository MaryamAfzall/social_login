import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class FacebookView extends StatelessWidget {
  //const FacebookView({super.key});
  final UserCredential userCredential;

  const FacebookView({Key? key, required this.userCredential}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Facebook Login'),
        ],
      ),
    );
  }
}
