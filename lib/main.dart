import 'package:animopedia_admin/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Animopedia Admin"),
      ),
      body: Dashboard(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(
                Icons.home,
                size: 30,
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(
                Icons.person,
                size: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(
                Icons.pets,
                size: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(
                Icons.settings,
                size: 30,
              ),
            ),
          ],
        ),
        shape: CircularNotchedRectangle(),
        color: Colors.white,
      ),
    );
  }
}
