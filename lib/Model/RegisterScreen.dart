import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tes1/model/RegisterResponse.dart';

@override 
widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('RegisterScreen'),
    ),
    body: Column(
      children: [
      Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration( hintText: 'enter name', labelText: 'udin',
              border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration( hintText: 'enter job',label: 'Guru',
              border: OutlineInputBorder(), ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.blueAccent,
              ),
              onPressed: () {},
              child: Text('Oke'),
            ),
            ),
            SizedBox(height: 10),
          ],
        ),
      )
    ],),
  );
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterResponse? registerResponse = null;
  TextEditingController nameController = TextEditingController();
  TextField(
    controller: nameController,
    Decoration: InputDecoration(
      hintText: 'enter name'
      labelText: 'udin'
      border: OutlineInputBorder(),
  ),
  ),
  TextEditingController jobController = TextEditingController();
  TextField(
    controller: jobController,
    Decoration: InputDecoration(
      hintText: 'enter job'
      labelText: 'Guru'
      border: OutlineInputBorder(),
  ),
  ),
  onPressed: (){
  RegisterResponse.connectToApi(
        nameController.text, jobController.text)
    .then((value)) {
      registerResponse = value;
      setState((){});
      SizedBox(height: 10),
      Text(registerResponse == null
      ?'no Data'
      : registerResponse!.id + ' | ' + registerResponse!.name + registerResponse!.job + registerResponse!.createdAt +)
    };
}
},


