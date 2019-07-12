import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Daniel Lopes"),
              accountEmail: Text("daniel.lopes@unifor.br"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://avatarfiles.alphacoders.com/856/85673.jpg"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.android),
              trailing: Icon(Icons.bug_report),
              title: Text("Android"),
              onTap: (){
                print("clicou android");
              },
            ),
            ListTile(
              leading: Icon(Icons.android),
              title: Text("Android"),
              trailing: Icon(Icons.bug_report),
              onTap: (){
                print("clicou android");
              },
            ),
            ListTile(
              leading: Icon(Icons.android),
              title: Text("Sair"),
              trailing: Icon(Icons.exit_to_app),
              onTap: (){
                print("clicou android");
              },
            ),
          ],
        ),
      ),
    );
  }
}