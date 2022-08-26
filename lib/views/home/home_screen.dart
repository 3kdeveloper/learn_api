import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_api/views/photos/photos_screen.dart';
import 'package:learn_api/views/post/post_screen.dart';
import 'package:learn_api/views/users/user_detail_screen.dart';
import 'package:learn_api/views/users/user_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn API'),
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                Get.to(const PostScreen());
              },
              child: const Text('Get All Post'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.to(const PhotosScreen());
              },
              child: const Text('Get All Photos'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.to(const UserScreen());
              },
              child: const Text('Get All Users'),
            ),
          ],
        ),
      ),
    );
  }
}
