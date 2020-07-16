
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:mandala/services/auth.dart';

class WebPage extends StatelessWidget {
  WebPage({@required this.auth});

  final AuthBase auth;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MANDALA Reader'),

        actions: <Widget>[
          //FlatButton(
           // child: Text(
             // 'Logout',
             // style: TextStyle(
             //   fontSize: 18.0,
             //   color: Colors.white,
            //  ),
           // ),
          //  onPressed: _signOut,
          //),
        ],
      ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://mandalasrm.blogspot.com/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            //_controller.complete(webViewController);
          },
          // TODO(iskakaushik): Remove this when collection literals makes it to stable.
          // ignore: prefer_collection_literals
          javascriptChannels: <JavascriptChannel>[
            //_toasterJavascriptChannel(context),
          ].toSet(),
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              print('blocking navigation to $request}');
              return NavigationDecision.prevent;
            }
            print('allowing navigation to $request');
            return NavigationDecision.navigate;
          },
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
          gestureNavigationEnabled: true,
        );
      }),
      //floatingActionButton: favoriteButton(),
    );
  }
}
