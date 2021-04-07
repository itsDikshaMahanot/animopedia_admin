import 'dart:io';

import 'package:animopedia_admin/controller/add_category.dart';
import 'package:animopedia_admin/view/screens/modify_screen.dart';
import 'package:animopedia_admin/view/screens/show_category.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Map> categoryImage = [
    {'name': '', 'img': ''},
    {'name': 'Fish', 'img': 'images/fish.jpg'},
    {'name': 'Dog', 'img': 'images/dog.jpg'},
    {'name': 'Plant', 'img': 'images/plant.jpg'},
    {'name': 'Plant', 'img': 'images/plant.jpg'}
  ];

  List<Map> listdata = [
    {'name': 'Fish', 'img': 'images/fish.jpg'},
  ];

  AddCategoryController addCategoryController = AddCategoryController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController subcategoryController = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.reference();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   postData();
  //   print("hello");
  // }

  final _imagePicker = ImagePicker();
  PickedFile _image;
  var _fileImg;

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
                itemCount: categoryImage.length,
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
                                return StatefulBuilder(
                                    builder: (context, setState) {
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
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: Container(
                                                      height: 100,
                                                      width: 120,
                                                      child: _fileImg != null
                                                          ? Image.file(_fileImg)
                                                          : Icon(
                                                              Icons
                                                                  .image_outlined,
                                                              size: 50,
                                                            )),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    selectImage();
                                                  },
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
                                                addData(categoryController.text,
                                                    subcategoryController.text);
                                                // addCategoryController.sendData(
                                                //     "fish",
                                                //     categoryController.text
                                                //         .toString(),
                                                //     subcategoryController.text
                                                //         .toString());
                                                uploadImage();
                                                categoryController.clear();
                                                subcategoryController.clear();
                                                //clearimage();
                                              },
                                              child: Text("Add Category"),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                              });
                        }
                        if (index != 0) {
                          if (index == 1) {
                            setState(() {
                              listdata = categoryImage;
                            });
                          }
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => show_category()));
                        }
                      },
                      child: Row(
                        children: [
                          Container(
                              height: 80,
                              width: 80,
                              child: index == 0
                                  ? Icon(
                                      Icons.add,
                                      size: 30,
                                    )
                                  : Image(
                                      image: AssetImage(
                                          categoryImage[index]['img']))),
                        ],
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
                itemCount: listdata.length,
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
                            child: Image(
                                image: AssetImage(listdata[index]['img'])))),
                  );
                },
              ),
            ))
          ],
        ));
  }

  void addData(String cat_data, String subcat_data) {
    databaseRef.push().set({'category': cat_data, 'sub category': subcat_data});
  }

  void clearimage() {
    setState(() {
      _image = null;
    });
  }

  uploadImage() async {
    final _firebaseStorage = FirebaseStorage.instance;
    String filename = basename(_image.path);

    if (_image != null) {
      //Upload to Firebase
      print(filename);
      var snapshot = await _firebaseStorage
          .ref()
          .child('images/$filename')
          .putFile(_fileImg);
      var downloadUrl = await snapshot.ref.getDownloadURL();
      // setState(() {
      //   imageUrl = downloadUrl;
      // });
      print(downloadUrl);
    } else {
      print('No Image Path Received');
    }
  }

  selectImage() async {
    imageCache.clear();
    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select Image
      _image = await _imagePicker.getImage(source: ImageSource.gallery);
      _fileImg = File(_image.path);
      setState() {
        if (_fileImg != null) {
          return Image.file(_fileImg);
          // return CircularProgressIndicator();
        } else {
          imageCache.clear();
          _image = null;
        }
      }
    } else {
      print('Permission not granted. Try Again with permission access');
    }
  }
}

_openDetailsPage(BuildContext context) => Navigator.of(context)
    .push(MaterialPageRoute(builder: (context) => ModifyScreen()));
