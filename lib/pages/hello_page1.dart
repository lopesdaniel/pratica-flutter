import 'package:flutter/material.dart';
import 'package:new_project_flutter/widgets/blue_button.dart';

class HelloPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Page 1"),
      ),
      body: _body(context),
    );
  }

  _body(context){
    return Center(
      child: BlueButton(
        "Back", 
        () => _onClickVoltar(context),
        color: Colors.pink,
      ),
    );
  }

  _onClickVoltar(context){
    Navigator.pop(context);
  }


}