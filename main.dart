import 'package:flutter/material.dart';
import './pages/ListPage.dart';
import './pages/PictureStream.dart';



void main(){

  runApp(new MaterialApp(

    home: HomePage(),

    routes: <String, WidgetBuilder>{
      "/StarWars_API": (BuildContext ctx) =>StarWarsData(),
      "/Stream_Pictures": (BuildContext ctx) => MyApp()
    }

  ));
}



class HomePage extends StatelessWidget{

final myColor1 = const Color(0xFF273c75);

  @override
  Widget build(BuildContext context){
    

    return Scaffold(
      appBar: new AppBar(title: new Text("Home"), 
                         backgroundColor: Colors.blueAccent
      ),
      
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new IconButton(
                icon: new Icon(Icons.data_usage, color: myColor1,),
                iconSize: 100.0,
                onPressed: (){
                  Navigator.of(context).pushNamed("/StarWars_API");
                }
              ),
              new Text("Get Data List", style: new TextStyle(fontSize: 25.0, fontStyle: FontStyle.italic),),
              
              new Container(
                padding: new EdgeInsets.all(25.0),
              ),
             
             new IconButton(
                    icon: new Icon(Icons.settings_system_daydream, color: const Color(0xFF4834d4),),
                    iconSize: 100.0,
                    onPressed: (){
                      Navigator.of(context).pushNamed("/Stream_Pictures");
                    }
                  ),

            new Text("Stream Pictures", style: new TextStyle(fontSize: 25.0, fontStyle: FontStyle.italic, color: const Color(0xFFe84118)),)
           ],
          )
        ),
      ),
    );
  }
}