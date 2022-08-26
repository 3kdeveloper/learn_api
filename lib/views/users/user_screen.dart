import 'dart:convert';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:learn_api/views/users/user_detail_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../model/UserModel.dart';
import 'package:http/http.dart' as http;

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<UserModel> usersList = [];

  Future<List<UserModel>> getAllUsers() async {
    http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        usersList.add(UserModel.fromJson(i));
      }

      return usersList;
    } else {
      return usersList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get All Users'),
      ),
      body: FutureBuilder(
          future: getAllUsers(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: LoadingAnimationWidget.fourRotatingDots(
                    color: Theme.of(context).primaryColor, size: 50),
              );
            } else {
              return ListView.builder(
                itemCount: usersList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      UserModel userModel = UserModel(
                        id: usersList[index].id,
                        name: usersList[index].name,
                        username: usersList[index].username,
                        email: usersList[index].email,
                        address: usersList[index].address,
                        phone: usersList[index].phone,
                        website: usersList[index].website,
                        company: usersList[index].company,
                      );
                      Get.to(() => UserDetailScreen(userModel: userModel));
                    },
                    title: Text(usersList[index].name.toString()),
                    subtitle: Text(usersList[index].email.toString()),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  );
                },
              );
            }
          }),
    );
  }
}
