import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_api/views/post/post_screen.dart';

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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(const PostScreen());
              },
              child: const Text('Get Post'),
            ),
          ],
        ),
      ),
    );
  }
}
