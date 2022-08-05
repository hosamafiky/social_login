import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_login/api/facebook_signin_api.dart';
import 'package:social_login/api/google_signin_api.dart';
import 'package:social_login/models/facebook_login_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GoogleSignInAccount? googleUser;
  void googleSignIn() async {
    final user = await GoogleSignInApi.login();
    if (user != null) {
      setState(() {
        googleUser = user;
      });
    }
  }

  FacebookAccount? loggedAccount;
  void facebookSignIn() async {
    final result = await FacebookSignInApi.login();
    if (result.status == LoginStatus.success) {
      FacebookSignInApi.getUserData().then((value) {
        setState(() {
          loggedAccount = FacebookAccount.fromJson(value);
        });
        print(loggedAccount!.name);
        print(loggedAccount!.email);
      });
    } else {
      print('User not selected!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          'Login With Social Media',
          style: TextStyle(
            color: Colors.orangeAccent,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => googleSignIn(),
            child: Container(
              width: 225.0,
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 15.0,
              ),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: const [
                  Image(
                    image: AssetImage(
                      'assets/images/google.png',
                    ),
                    width: 50.0,
                    height: 50.0,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'Sign in with GOOGLE',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: double.infinity, height: 15.0),
          InkWell(
            onTap: () => facebookSignIn(),
            child: Container(
              width: 240.0,
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 15.0,
              ),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: const [
                  Image(
                    image: AssetImage(
                      'assets/images/facebook.png',
                    ),
                    width: 50.0,
                    height: 50.0,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'Sign in with FACEBOOK',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
