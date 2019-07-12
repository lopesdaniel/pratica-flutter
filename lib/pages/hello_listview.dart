import 'package:flutter/material.dart';
import 'package:new_project_flutter/utils/nav.dart';

import 'dog_page.dart';

class Dog{
  String nome;
  String foto;
  
  Dog(this.nome, this.foto);
}

class HelloListView extends StatefulWidget {

  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView e GridView"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.format_list_bulleted),
            onPressed: (){
              print("Lista");
              setState(() {
                _gridView = false;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: (){
              print("Grid");
              setState(() {
                _gridView = true;
              });
            },
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body(){
    List<Dog> dogs = [
      Dog("Totó", "assets/images/dog1.jpg"),
      Dog("Snoop", "assets/images/dog2.jpg"),
      Dog("Lessi", "assets/images/dog3.jpg"),
      Dog("Totó", "assets/images/dog1.jpg"),
      Dog("Snoop", "assets/images/dog2.jpg"),
      Dog("Lessi", "assets/images/dog3.jpg"),
      Dog("Totó", "assets/images/dog1.jpg"),
      Dog("Snoop", "assets/images/dog2.jpg"),
      Dog("Lessi", "assets/images/dog3.jpg"),
      Dog("Totó", "assets/images/dog1.jpg"),
      Dog("Snoop", "assets/images/dog2.jpg"),
      Dog("Lessi", "assets/images/dog3.jpg"),
    ];

    if(_gridView) {
      return GridView.builder(
        itemCount: dogs.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index){
          return _itemView(dogs, index);  
        },
      );
    } else {
      return ListView.builder(
        itemCount: dogs.length,
        itemExtent: 280,
        itemBuilder: (context, index){
          return _itemView(dogs, index);  
        },
      );
    }

  }

  _itemView(List<Dog> dogs, int index) {
    return GestureDetector(
          onTap: (){
            push(context, DogPage(dogs[index]));
          },
          child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _img(dogs[index].foto),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), topRight: Radius.circular(12)),
                  ),
                  child: Text(
                  dogs[index].nome,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ],
        ),
    );
  }

  _img(String path){
    return Image.asset(
        path,
        fit: BoxFit.cover,
      );
  }
}