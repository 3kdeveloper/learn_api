import 'package:flutter/material.dart';
import 'package:learn_api/model/UserModel.dart';

class UserDetailScreen extends StatelessWidget {
  final UserModel userModel;

  const UserDetailScreen({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userModel.name.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            CustomDetailTile(title: 'Name', output: userModel.name),
            const SizedBox(height: 10),
            CustomDetailTile(title: 'User Name', output: userModel.username),
            const SizedBox(height: 10),
            CustomDetailTile(title: 'Email', output: userModel.email),
            const SizedBox(height: 10),
            CustomDetailTile(title: 'Phone', output: userModel.phone),
            const SizedBox(height: 10),
            CustomDetailTile(title: 'Website', output: userModel.website),
            const SizedBox(height: 10),
            const Text('Address'),
            const SizedBox(height: 10),
            CustomDetailTile(
                title: 'Street', output: userModel.address!.street),
            const SizedBox(height: 10),
            CustomDetailTile(title: 'Suite', output: userModel.address!.suite),
            const SizedBox(height: 10),
            CustomDetailTile(title: 'city', output: userModel.address!.city),
            const SizedBox(height: 10),
            CustomDetailTile(
                title: 'zipcode', output: userModel.address!.zipcode),
            const SizedBox(height: 10),
            const Text('Geo'),
            const SizedBox(height: 10),
            CustomDetailTile(title: 'Lat', output: userModel.address!.geo!.lat),
            const SizedBox(height: 10),
            CustomDetailTile(title: 'Lng', output: userModel.address!.geo!.lng),
            const SizedBox(height: 10),
            const Text('Company'),
            const SizedBox(height: 10),
            CustomDetailTile(title: 'Name', output: userModel.company!.name),
            const SizedBox(height: 10),
            CustomDetailTile(
                title: 'Catch Phrase', output: userModel.company!.catchPhrase),
            const SizedBox(height: 10),
            CustomDetailTile(title: 'Bs', output: userModel.company!.bs),
          ],
        ),
      ),
    );
  }
}

class CustomDetailTile extends StatelessWidget {
  final String? title, output;

  const CustomDetailTile({Key? key, this.title, this.output}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title!),
        const Spacer(),
        Text(output!),
      ],
    );
  }
}
