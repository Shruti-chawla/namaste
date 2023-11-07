import 'dart:convert';

import 'package:con_practice/update_record.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class view_data extends StatefulWidget{
  view_data({Key?key}) : super(key:key);

  @override
  State<view_data> createState() => _view_dataState();
}

class _view_dataState extends State<view_data>{

  List userdata=[];

  Future<void> delrecord(String id) async{
    try{
      String uri = "http://10.0.2.2/practice_api/delete_data.php";
      var res=await http.post(Uri.parse(uri),body:{"id":id});
      var response=jsonDecode(res.body);
      if(response["success"]=="true"){
        print("record deleted");
        getrecord();
      }
      else{
        print("some issue");
      }
    }
    catch(e){print(e);}
  }
  Future<void>getrecord() async{
    String uri = "http://10.0.2.2/practice_api/view_data.php";
    try{
      var response=await http.get(Uri.parse(uri));
      setState(() {
        userdata=jsonDecode(response.body);
      });

    }
    catch(e){
      print(e);
    }
  }


  @override
  void initState(){
    getrecord();
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text("View Data")),
      body: ListView.builder(
        itemCount: userdata.length,
        itemBuilder: (context,index){
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              onTap:(){
                Navigator.push(context,MaterialPageRoute(builder: (context) => update_record(userdata[index]["uname"],
                userdata[index]["uemail"],
                userdata[index]["upassword"])));
              },
              title: Text(userdata[index]["uname"].toString()),
              subtitle: Text(userdata[index]["uemail"].toString()),
              trailing: IconButton(icon: Icon(Icons.delete),
                onPressed:(){
                delrecord(userdata[index]["uid"]);
                },)
            ),
          );
        },
      ),
    ));
  }
}


