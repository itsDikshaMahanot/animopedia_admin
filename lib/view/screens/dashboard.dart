import 'package:animopedia_admin/controller/add_category.dart';
import 'package:animopedia_admin/view/screens/modify_screen.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  AddCategoryController addCategoryController = AddCategoryController();

  TextEditingController categoryController = TextEditingController();
  TextEditingController subcategoryController = TextEditingController();

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
                              builder: (BuildContext context) {
                                return FittedBox(
                                  child: AlertDialog(
                                    content: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextField(
                                            controller: categoryController,
                                            decoration: InputDecoration(
                                                hintText: "Category"),
                                          ),
                                          TextField(
                                            controller: subcategoryController,
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
                                              ElevatedButton(
                                                onPressed: () {},
                                                child: Icon(
                                                  Icons.upload_file,
                                                  semanticLabel: "Upload",
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.greenAccent[
                                                  700], // back foreground
                                            ),
                                            onPressed: () {
                                              addCategoryController.sendData(
                                                  "fish",
                                                  categoryController.text
                                                      .toString(),
                                                  subcategoryController.text
                                                      .toString());

                                              categoryController.clear();
                                              subcategoryController.clear();
                                            },
                                            child: Text("Add Category"),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
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
                  autofocus: false,
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
            ))
          ],
        ));
  }
}

_openDetailsPage(BuildContext context) => Navigator.of(context)
    .push(MaterialPageRoute(builder: (context) => ModifyScreen()));

//* Overlapping Buttons on card
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