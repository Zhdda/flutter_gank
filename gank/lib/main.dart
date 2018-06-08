import 'package:flutter/material.dart';
import 'package:gank/page/mainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:gank/page/webpage.dart';

void main() {
  runApp(new GankApp());
}

class GankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '干货集中营',
      theme: new ThemeData(
      ),
      home: new MyGankClient(),
    );
  }
}

class MyGankClient extends StatefulWidget {
  @override
  GankClientState createState() => new GankClientState();

}

class GankClientState extends State<MyGankClient> {
  int _tabIndex = 0;
  final tabTextStyleNormal = new TextStyle(color: Colors.blueGrey);
  final tabTextStyleSelected = new TextStyle(color: Colors.blue);

  var tabImages;
  var _body;
  var appBarTitles = ['干货', '资讯'];

  Icon getTabIcon(IconData icon) {
    return new Icon(icon);
  }

  void initData() {
    if (tabImages == null) {
      tabImages = [
        [
          getTabIcon(CupertinoIcons.book),
          getTabIcon(CupertinoIcons.book)
        ],
      ];
    }
    _body = new IndexedStack(
      children: <Widget>[
        new MainPage(),
        new Center(
            child: new MaterialButton(
              height: 500.0,
              minWidth: 200.0,
              child: new Text('去网页查看干货' ,style: new TextStyle(fontSize: 34.0),),
                onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new WebPage(url: 'http://gank.io/',title:  '干货集中营');
              }));
            },

            )

        ),
      ],
      index: _tabIndex,
    );
  }

  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabTextStyleSelected;
    }
    return tabTextStyleNormal;
  }

  Text getTabTitle(int curIndex) {
    return new Text(appBarTitles[curIndex], style: getTabTextStyle(curIndex));
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: const Color(0xFF63CA6C),
      ),
      home: new Scaffold(
        appBar: new AppBar(
            backgroundColor: Colors.white,
            title: new Text(appBarTitles[_tabIndex],
                style: new TextStyle(color: Colors.blue)),
            iconTheme: new IconThemeData(color: Colors.white)
        ),
        body: _body,
        bottomNavigationBar: new CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: getTabIcon(CupertinoIcons.home),
                title: getTabTitle(0)),
            new BottomNavigationBarItem(
                icon: getTabIcon(CupertinoIcons.book),
                title: getTabTitle(1)),
          ],
          currentIndex: _tabIndex,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
      ),
    );
  }

}