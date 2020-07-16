import 'package:flutter/material.dart';
import 'package:mandala/app/sign_in/email_sign_in_form.dart';
import 'package:mandala/services/auth.dart';

class EmailSignInPage extends StatelessWidget {
  EmailSignInPage({@required this.auth});
  final AuthBase auth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
              child: EmailSignInForm(auth: auth,),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
  Widget _buildContent() {
    return Container();
  }
}
