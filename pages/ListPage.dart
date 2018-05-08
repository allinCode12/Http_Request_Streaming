import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataPage extends StatelessWidget{
  @override
  Widget build(BuildContext ctx){
    return Scaffold(
      body: StarWarsData(),
    );
  }
}

class StarWarsData extends StatefulWidget {

  @override
  StarWarsState createState() =>  StarWarsState();
}

class StarWarsState extends State<StarWarsData>{
  final String url = "https://swapi.co/api/starships";
  List data;

  Future<String> getSWData() async{
    var res = await http
      .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    
    setState(() {
        var resBody = json.decode(res.body);
        data = resBody["results"];
        });

    return "Success!";
    
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:  Text("Data Starwars Starships"),
        backgroundColor: const Color(0xFF273c75),
      ),

      body: ListView.builder(
        itemCount: data  == null ? 0: data.length,
        itemBuilder: (BuildContext context, int index){
          return new Container(
           child: Center(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: <Widget>[
                 
                 
                 Card(
                   child: Container(
                     padding: new EdgeInsets.all(15.0),
                      child: Row(
                        children: <Widget>[
                          Text("Name:  "),
                          new Text(data[index]["name"],
                              style: new TextStyle(fontSize: 18.0,
                              color: Colors.black54))
                        ],
                      ),
                   ),
                  ),
                 
                 
                  Card(
                    child: Container(
                      padding: new EdgeInsets.all(15.0),
                        child: Row(
                           children: <Widget>[
                             Text("Model:  "),
                             new Text(data[index]["model"],
                                  style: new TextStyle(fontSize: 18.0,
                                  color: Colors.blueAccent))
                           ], 
                        ),
                    ),
                  ),
               ],
             ),
           ),
          );
        },
      ),
    );  
  }

  @override
  void initState(){
    super.initState();
    this.getSWData();
  }
}