import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mandala/app/sign_in/email_sign_in_page.dart';
import 'package:mandala/app/sign_in/sign_in_button.dart';
import 'package:mandala/app/sign_in/social_sign_in_button.dart';
import 'package:mandala/services/auth.dart';

class SignInPage extends StatelessWidget {
  SignInPage({@required this.auth});

  final AuthBase auth;

  Future<void> _signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  void _signInWithEmail(BuildContext context) {
    // Show EmailSignInPage
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(auth: auth,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MANDALA: The Mind Circle'),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }


  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Mental Health Matters',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 40.0,),
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: _signInWithGoogle,
          ),
          SizedBox(height: 10.0,),

          SignInButton(
            text: 'Sign in with Email',
            textColor: Colors.white,
            color: Colors.black,
            onPressed: () => _signInWithEmail(context),
          ),
          SizedBox(height: 8.0,),
          Text(
            'or',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.0,),
          SignInButton(
              text: 'Go anonymous',
              textColor: Colors.black,
              color: Colors.orange,
              onPressed: _signInAnonymously,
          ),
          SizedBox(height: 30.0,),
          Text(
            'This application requires an active Internet connection.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 3.0,),
          Text(
            'Some functions might take time to load.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
            ),
          ),

        ],
      ),
    );
  }
}
