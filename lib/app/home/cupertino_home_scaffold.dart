import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mandala/app/home/top_item.dart';

class CupertinoHomeScaffold extends StatelessWidget {
  const CupertinoHomeScaffold(
      {Key key, @required this.currentTab, @required this.onSelectTab,
      @required this.widgetBuilder})
      : super(key: key);
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  final Map<TabItem, WidgetBuilder> widgetBuilder;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
        _buildItem(TabItem.web),
        _buildItem(TabItem.form),
        _buildItem(TabItem.account),
      ],
        onTap: (index) => onSelectTab(TabItem.values[index]),
      ),
      tabBuilder: (context, index){
        final item = TabItem.values[index];
        return CupertinoTabView(
          builder: (context) => widgetBuilder[item](context),
        );
      },
    );
  }
  BottomNavigationBarItem _buildItem(TabItem tabItem){
    final itemData = TabItemData.allTabs[tabItem];
    final color= currentTab == tabItem ? Colors.black : Colors.grey;
    return BottomNavigationBarItem(
      icon: Icon(itemData.icon,
      color: color,),
      title: Text(itemData.title,
      style: TextStyle(color: color),),
    );
  }
}

