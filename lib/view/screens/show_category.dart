import 'package:animopedia_admin/view/screens/modify_screen.dart';
import 'package:flutter/material.dart';

class show_category extends StatefulWidget {
  show_category({Key key}) : super(key: key);

  @override
  _show_categoryState createState() => _show_categoryState();
}

class _show_categoryState extends State<show_category> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.fromLTRB(10, 10, 10, 30),
              child: GestureDetector(
                onTap: () => _openDetailsPage(context),
                child: Container(
                    height: 150,
                    width: 150,
                    child: Image.network(
                      "https://source.unsplash.com/200x200/?fish",
                      fit: BoxFit.cover,
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}

_openDetailsPage(BuildContext context) => Navigator.of(context)
    .push(MaterialPageRoute(builder: (context) => ModifyScreen()));
