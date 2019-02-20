import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation_drawer/fragment/first_fragment.dart';
import 'package:navigation_drawer/fragment/second_fragment.dart';
import 'package:navigation_drawer/fragment/third_fragment.dart';
import 'package:toast/toast.dart';

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Home", Icons.rss_feed),
    new DrawerItem("About", Icons.local_pizza),
    new DrawerItem("Contact", Icons.info)
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new FirstFragment();
      case 1:
        return new SecondFragment();
      case 2:
        return new ThirdFragment();

      default:
        return new Text("Error This one");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepPurple,
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 40.0, bottom: 20.0),
                height: 0.0,
                child: new Text(
                  "Company Name",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
//            new DrawerHeader(
//              child: Center(
//                child: Container(
//                  height: 20.0,
//                  child: new Text("Company Name" , textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0),),
//                ),
//              ),
//
//              //                accountName: new Text("John Doe"),
////                accountEmail: new Text("rahul@123")
//            ),

            new Column(children: drawerOptions),

            Container(
              height: 1.0,
              color: Colors.black12,
            ),

            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                child: new RaisedButton(
                  onPressed: subtractNumbers,
                  textColor: Colors.white,
                  color: Colors.grey,
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: new Text(
                    "Logout",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }

  void subtractNumbers() {
    Toast.show("Logout...", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
    Navigator.of(context).pop();
  }
}
