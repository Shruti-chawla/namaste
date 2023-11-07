import 'package:flutter/material.dart';

class update_record extends StatefulWidget{
  String name;
  String email;
  String password;

  update_record(this.name, this.email, this.password);

  @override
  State<update_record> createState() => _update_recordState();
}

class _update_recordState extends State<update_record>{
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> updaterecord() async{
    @override
    void initState() {
      name.text = widget.name;
      email.text = widget.email;
      password.text = widget.password;
      super.initState();
    @override
    void dispose(){

      super.dispose();
    }
    }

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Update Record")),
      body: Column(children: [
        Container(
           margin: EdgeInsets.all(10),
           child: TextFormField(
            controller: name,
            decoration:InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Enter the name'))
           )
      ),
        Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
             controller: email,
             decoration:InputDecoration(
                 border: OutlineInputBorder(),
                 label: Text('Enter the Email'))
            )
      ),
         Container(
             margin: EdgeInsets.all(10),
              child: TextFormField(
                 controller: password,
                 decoration:InputDecoration(
                     border: OutlineInputBorder(),
                     label: Text('Enter the Password'))
               )
      ),
         Container(
              margin:EdgeInsets.all(10),
               child: ElevatedButton(onPressed: (){
                      updaterecord();
               },
                       child: Text('Update'))

         )],)
    );
  }
}