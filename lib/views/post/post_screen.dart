import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:learn_api/views/post/post_detail_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../model/PostModel.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<PostModel> postsList = [];

  Future<List<PostModel>> getPost() async {
    http.Response response = await http.get(Uri.parse(
      'https://jsonplaceholder.typicode.com/posts',
    ));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      postsList.clear();
      for (Map i in data) {
        postsList.add(PostModel.fromJson(i));
      }
      return postsList;
    } else {
      return postsList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get All Posts'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getPost(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: LoadingAnimationWidget.threeRotatingDots(
                    color: Theme.of(context).primaryColor, size: 50),
              );
            } else {
              return ListView.builder(
                  itemCount: postsList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          PostModel postModel = PostModel(
                            title: postsList[index].title,
                            body: postsList[index].body,
                          );
                          Get.to(() => PostDetailScreen(postModel: postModel));
                        },
                        title:
                            Text(postsList[index].title!.capitalize.toString()),
                        subtitle: const Text('Tap for more'),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
