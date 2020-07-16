import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mandala/app/home/cupertino_home_scaffold.dart';
import 'package:mandala/app/home/top_item.dart';
import 'package:mandala/app/sign_in/AboutPage.dart';
import 'package:mandala/app/sign_in/FormPage.dart';
import 'package:mandala/app/sign_in/WebPage.dart';
import 'package:mandala/services/auth.dart';

class HomePage extends StatefulWidget {
  HomePage({@required this.auth});
  _HomePageState createState() => _HomePageState();
  final AuthBase auth;


  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}

class _HomePageState extends State<HomePage> {
  TabItem _currentTab = TabItem.web;

  Map<TabItem, WidgetBuilder> get widgetBuilders {
    return {
      TabItem.web: (_) => WebPage(),
      TabItem.form: (_) => FormPage(),
      TabItem.account: (_) => AboutPage(),
    };
  }

  void _selectTab(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  @override
  Widget build(BuildContext context) {

    return CupertinoHomeScaffold(
      currentTab: _currentTab,
      onSelectTab: _selectTab,
      widgetBuilder: widgetBuilders,

    );

  }
}