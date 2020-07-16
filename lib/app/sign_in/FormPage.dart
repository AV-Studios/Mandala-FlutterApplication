
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Book a Session'),
        ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://docs.google.com/forms/d/e/1FAIpQLSfIT2G_vO87n289UHZzDIlAufG6cAuTXBt5V3T0T2sCB3AZsg/viewform?usp=sf_link',
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
