import 'package:flutter/material.dart';
import 'package:sliver_fab/sliver_fab.dart';

class ModifyScreen extends StatefulWidget {
  ModifyScreen({Key key}) : super(key: key);

  @override
  _ModifyScreenState createState() => _ModifyScreenState();
}

class _ModifyScreenState extends State<ModifyScreen> {
  bool isEditable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                actions: <Widget>[
                  IconButton(
                    icon: isEditable == false
                        ? Icon(Icons.edit)
                        : Icon(Icons.check_circle),
                    tooltip: 'edit fields',
                    onPressed: () {
                      setState(() {
                        if (isEditable == false) {
                          isEditable = true;
                        } else {
                          isEditable = false;
                        }
                      });
                    },
                  ),
                ],
                expandedHeight: 250,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Tiger Oscar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                      )),
                  background: ShaderMask(
                      shaderCallback: (rect) {
                        return LinearGradient(
                                end: Alignment.topCenter,
                                begin: Alignment.bottomCenter,
                                colors: [Colors.black, Colors.transparent])
                            .createShader(Rect.fromLTRB(0, 100, 0, 350));
                      },
                      blendMode: BlendMode.darken,
                      child: Image.network(
                        "https://source.unsplash.com/200x200/?fish",
                        fit: BoxFit.cover,
                      )),
                ),
                floating: false,
                pinned: true,
                snap: false,
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Species',
                      ),
                      textAlign: TextAlign.center,
                      enabled: isEditable,
                      initialValue: 'Chichlids',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                      ),
                      textAlign: TextAlign.center,
                      enabled: isEditable,
                      initialValue: 'Tiger Oscar',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Native',
                      ),
                      textAlign: TextAlign.center,
                      enabled: isEditable,
                      initialValue: 'South Africa',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    height: 50.0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            style: BorderStyle.solid,
                            width: 2.0,
                          ),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Text(
                                "DELETE",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 2,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
