import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_api/model/PostModel.dart';

class PostDetailScreen extends StatelessWidget {
  final PostModel postModel;

  const PostDetailScreen({
    Key? key,
    required this.postModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(postModel.title!.capitalize.toString()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(postModel.body!.capitalize.toString()),
      ),
    );
  }
}
