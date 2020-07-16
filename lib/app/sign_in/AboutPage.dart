import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About us'),
      ),
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      //mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      child: Column(children: <Widget>[
        SizedBox(
          height: 8.0,
        ),
        Text(
          'Mental Health Matters',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          'Mandala: The Mind Circle is the mental health society of SRM University, Delhi NCR. This society focuses on the mental well being of every student in the university and extends help to anyone who is dealing with psychological crisis.',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          'We want to make sure that nobody in the university is going through mental issues or traumas, and thus we wish to provide relief and a safe space where you can discuss such issues.',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          'This society was formed recently in the month of March. We weren\'t able to organize any activities within the campus but we plan on doing so once the university reopens.',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 14.0,
        ),
        new Center(
          child: new RichText(
            text: new TextSpan(
              children: [
                new TextSpan(
                  text: 'For more details, Follow us on ',
                  style: new TextStyle(color: Colors.black,
                    fontSize: 16.0,),
                ),
                new TextSpan(
                  text: ' Instagram.',
                  style: new TextStyle(color: Colors.deepOrange,
                    fontSize: 18.0,),
                  recognizer: new TapGestureRecognizer()
                    ..onTap = () {
                      launch(
                          'https://instagram.com/mandala.srm');
                    },
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
