import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserResponse {
  String id;
  String email;
  String name;
  String avatar;

  UserResponse({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
  });

  factory UserResponse.createdUserResponse(Map<String, dynamic> object) {
    return UserResponse(
        id: object['id'].toString(),
        email: object['email'],
        name: object['first_name'] + " " + object['last_name'],
        avatar: object['avatar']);
  }

  static Future<List<UserResponse>> getUserList(String page) async {
    var apiUrl = Uri.parse("https://reqres.in/api/users?page=" + page);
    var apiResult = await http.get(apiUrl);

    var jsonObject = json.decode(apiResult.body);
    List<UserResponse> users = [];
    for (int i = 0; i < listUser.length; i++) {
      user.add(UserResponse.createdUserResponse(listUser[i]));
    }
    return users;
  }
}

class _userScreenstate extends State<UserScreen> {
  UserResponse? userResponse = null;
  List<UserResponse> userList = [];
  @override
  widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar User'),
      ),
      body: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: Card(
                child: Row(children: [
                  Image(
                      width: 100,
                      height: 100,
                      image: NetworkImage(userList[index].avatar)),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(userList[index].name),
                        Text(userList[index].email),
                      ],
                    ),
                  )
                ]),
              ),
            );
          }),
    );
  }
}

UserResponse? userResponse = null;
List<UserResponse> userList = [];

@override 
void initState() {
  print("init state")
  UserResponse.getUserList("1").then((value) {
    userList =value;
    setState(() {});
  });
  super.initState();
}