import 'package:flutter/material.dart';

class Produto{
  String nome;
  String foto;
  
  Produto(this.nome, this.foto);

}

class HelloPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Page 2"),
      ),
      body: _body(),
    );
  }

  _body(){
    List<Produto> produtos = [
      Produto("8G DDR3", "assets/images/ram1.jpg"),
      Produto("8G DDR3", "assets/images/ram2.jpg"),
      Produto("8G DDR3", "assets/images/ram3.jpg"),
      Produto("8G DDR3", "assets/images/ram1.jpg"),
      Produto("8G DDR3", "assets/images/ram2.jpg"),
      Produto("8G DDR3", "assets/images/ram3.jpg"),
      Produto("8G DDR3", "assets/images/ram1.jpg"),
      Produto("8G DDR3", "assets/images/ram2.jpg"),
      Produto("8G DDR3", "assets/images/ram3.jpg"),
    ];

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 6, mainAxisSpacing: 8),
      itemCount: produtos.length,
      itemBuilder: (context, index){
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _img(produtos[index].foto),
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
                  produtos[index].nome,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  _img(String path){
    return Image.asset(
        path,
        fit: BoxFit.cover,
      );
  }

}