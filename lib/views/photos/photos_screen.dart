import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learn_api/model/custom_photo_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:http/http.dart' as http;

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({Key? key}) : super(key: key);

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  List<PhotoModel> photosList = [];

  Future<List<PhotoModel>> getPhotos() async {
    http.Response response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        PhotoModel photoModel = PhotoModel(
          id: i['id'],
          title: i['title'],
          url: i['url'],
          thumbnailUrl: i['thumbnailUrl'],
        );
        photosList.add(photoModel);
      }
      return photosList;
    } else {
      return photosList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get All Photos'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getPhotos(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Theme.of(context).primaryColor, size: 50),
            );
          } else {
            return ListView.builder(
                itemCount: photosList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(photosList[index].url.toString()),
                    ),
                    title: Text(photosList[index].title.toString()),
                  );
                });
          }
        },
      ),
    );
  }
}
