import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class PicPage extends StatelessWidget{
  @override
  Widget build(BuildContext ctx){
    return Scaffold(
      body: PictureData(),
    );
  }
}

class PictureData extends StatefulWidget{

  @override
  PictureDataState createState() => new PictureDataState();
}

class PictureDataState extends State<PictureData> {

  
}

//changes

