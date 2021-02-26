import 'package:animopedia_admin/view/screens/dashboard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            color: Colors.red[100],
          ),
          SizedBox(
            height: 2.0,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 500,
              color: Colors.grey[200],
              child: GridView.builder(
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 30),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return Dashboard();
                          }),
                        ),
                        child: Container(
                            height: 150,
                            width: 150,
                            child: Image.network(
                              "https://source.unsplash.com/200x200/?fish",
                              fit: BoxFit.cover,
                            )),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
