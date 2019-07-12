import 'package:flutter/material.dart';
import 'package:new_project_flutter/pages/hello_listview.dart';
import 'package:new_project_flutter/pages/hello_page1.dart';
import 'package:new_project_flutter/pages/hello_page2.dart';
import 'package:new_project_flutter/pages/hello_page3.dart';
import 'package:new_project_flutter/widgets/blue_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_project_flutter/widgets/drawer_list.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: 3,
          child: Scaffold(
          appBar: AppBar(
            title: Text("Olá Flutter"),
            centerTitle: true,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: "Tab 1",),
                Tab(text: "Tab 2",),
                Tab(text: "Tab 3",),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              _body(context),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.red,
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blueGrey,
            child: Icon(Icons.add, color: Colors.yellowAccent,),
            onPressed: (){},
          ),
          drawer: DrawerList(
          ),
      ),
    );

  }
        
    _body(BuildContext context){
      return Container(
          color: Colors.black87,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _pageView(),
              _buttons()
            ],
          )
        );
    }

    _img(String path){
      return Container(
        margin: EdgeInsets.all(10),
        child: Image.asset(
          path
        )
      );
    }

    _buttons(){
      return Builder(builder: (BuildContext context) {
        return Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      BlueButton("ListView", () => _onClickNavigator(context, HelloListView())),
                      BlueButton("Page 2", () => _onClickNavigator(context, HelloPage2())),
                      BlueButton("Page 3", () => _onClickNavigator(context, HelloPage3())),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      BlueButton("Snack", () => _onClickSnack(context)),
                      BlueButton("Dialog", () => _onClickDialog(context)),
                      BlueButton("Toast", _onClickToast),
                    ],
                  ),
                ],
              );
      },
      );
    }
    
    void _onClickNavigator(BuildContext context, Widget page) {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
        return page;
      }));
    }
  _onClickSnack(BuildContext context){
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("Olá Flutter"),
        action: SnackBarAction(
          textColor: Colors.yellow,
          label: "OK",
          onPressed: () {
            print("OK!");
          },
        ),
      ),
    );
  }

  _onClickDialog(BuildContext context){
    showDialog(context: context, 
    barrierDismissible: false,
    builder: (context){
      return AlertDialog(
        title: Text("Flutter é massa.."),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Cancelar",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: Text("OK"),
            onPressed: (){
              Navigator.pop(context);
              print("Apertou OK");
            },
          ),
        ],
      );
    });
  }

  _onClickToast(){
    Fluttertoast.showToast(
        msg: "Flutter é show de bola !",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIos: 2,
        backgroundColor: Colors.blueAccent,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
    _pageView(){
      return Container(
                margin: EdgeInsets.all(20),
                height: 296,
                child: PageView(
                  children: <Widget>[
                    _img("assets/images/dog1.jpg"),
                    _img("assets/images/dog2.jpg"),
                    _img("assets/images/dog3.jpg")
                  ],
                ),
              );
    }    
    




}