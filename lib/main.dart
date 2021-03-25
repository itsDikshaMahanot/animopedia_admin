import 'package:custom_navigator/custom_scaffold.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:animopedia_admin/view/screens/dashboard.dart';
import 'package:animopedia_admin/view/screens/modify_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomeScreen(),
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.blue[900],
          type: BottomNavigationBarType.fixed,
          elevation: 10,
          selectedLabelStyle: TextStyle(color: Colors.white, fontSize: 14.0),
          unselectedLabelStyle:
              TextStyle(color: Colors.black54, fontSize: 12.0),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black54,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffold: Scaffold(
        appBar: AppBar(
          title: Text("Animopedia Admin"),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ModifyScreen())),
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          items: _items,
        ),
      ),

      // Children are the pages that will be shown by every click
      // They should placed in order such as
      // `page 0` will be presented when `item 0` in the [BottomNavigationBar] clicked.
      children: <Widget>[Dashboard(), ModifyScreen(), Dashboard(), Dashboard()],

      // Called when one of the [items] is tapped.
      onItemTap: (index) {},
    );
  }
}

List<BottomNavigationBarItem> _items = [
  BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
  BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Shop"),
  BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
];
