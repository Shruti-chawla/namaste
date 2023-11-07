import 'dart:convert';
import 'package:con_practice/view_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> insertrecord() async
  {
    if(name.text!="" || email.text!="" || password.text!="")
      {
        try{
          String uri = "http://10.0.2.2/practice_api/insert_record.php";
          var res = await http.post(Uri.parse(uri),body:{
            "name":name.text,
            "email": email.text,
            "password":password.text
          });
          var response = jsonDecode(res.body);
          if(response["success"]=="true"){
            print("Record Inserted");
            name.text="";
            email.text="";
            password.text="";
          }
          else{
            print("Some issues");
          }
        }

        catch(e){
          print(e);
        }

      }
    else{
      print("please fill all the fields");
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(
        title: Text('Insert Record'),
      ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: name,
                decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter the name'))
              )
            ),
            Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  controller: email,
                    decoration:const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Enter the Email'))
                )
            ),
            Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  controller: password,
                    decoration:const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Enter the Password'))
                )
            ),
            Container(
              margin:EdgeInsets.all(10),
              child: ElevatedButton(onPressed: (){
                insertrecord();
              },
              child: Text('Insert')),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Builder(
                builder: (context){
                  return ElevatedButton(
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => view_data()));
                  }, child:Text("View Data"));
                },
              )
            )
          ]),
        )
      ),
    );
  }
}


