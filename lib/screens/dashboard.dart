import 'package:animopedia_admin/screens/modify_screen.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(top: 20),
        color: Colors.grey[100],
        height: double.infinity,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.fromLTRB(20, 10, 15, 10),
                    child: GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          showDialog(
                              context: context,
                              child: AlertDialog(
                                content: Container(
                                  height: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextField(
                                        decoration: InputDecoration(
                                            hintText: "Category"),
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                            hintText: "Sub Category"),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          FlutterLogo(
                                            size: 50,
                                          ),
                                          RaisedButton(
                                            onPressed: () {},
                                            color: Colors.yellow[800],
                                            child: Icon(Icons.upload_file),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ));
                        }
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        child: index == 0
                            ? Icon(
                                Icons.add,
                                size: 30,
                              )
                            : FlutterLogo(),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey[400],
                    blurRadius: 5,
                    offset: Offset(0, 5))
              ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(20),
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: TextField(
                  style: TextStyle(fontSize: 22),
                  onChanged: (String value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    hintText: "Search..",
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
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
                          return ModifyScreen();
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
                },
              ),
            ))
          ],
        ));
  }
}

// Positioned(
//                           left: 0,
//                           right: 0,
//                           bottom: -25,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               FloatingActionButton(
//                                 backgroundColor: Colors.red,
//                                 mini: true,
//                                 onPressed: null,
//                                 child: Icon(Icons.delete),
//                               ),
//                               FloatingActionButton(
//                                 backgroundColor: Colors.amber,
//                                 mini: true,
//                                 onPressed: null,
//                                 child: Icon(Icons.edit),
//                               ),
//                             ],
//                           ),
//                         )
