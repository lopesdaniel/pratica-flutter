import 'package:flutter/material.dart';

Future push(context, page){
  return Navigator.push(context, MaterialPageRoute(builder: (context){
    return page;
  }));
}