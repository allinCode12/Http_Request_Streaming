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
  
  StreamController<Photo> streamController;
  //To initialize the State
  List<Photo> list = [];


  @override 
  void initState() {
    super.initState();
    streamController = StreamController.broadcast();

    streamController.stream.listen((p) =>
      setState(() 
      => list.add(p)));

    load(streamController);
  

  }

  load (StreamController sc) async{
    String url = "https://jsonplaceholder.typicode.com/photos";
    
    var client = new http.Client();

    var request =  new http.Request('get', Uri.parse(url));


    var streamRes = await client.send(request);


  }
}



class Photo{
  final String title;
  final String url;



  Photo.fromJsonMap(Map map)
    : title = map['title'],
      url = map['url'];
}

