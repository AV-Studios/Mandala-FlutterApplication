import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TabItem {web, form, account}

class TabItemData{
  const TabItemData({@required this.title,@required this.icon});
  final String title;
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
   TabItem.web: TabItemData(title: 'Blog', icon: Icons.weekend),
    TabItem.form: TabItemData(title: 'Talk to Us', icon: Icons.question_answer),
    TabItem.account: TabItemData(title: 'About', icon: Icons.person_pin_circle),
  };
 }