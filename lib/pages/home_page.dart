import 'dart:developer';

import 'package:api_json/models/models.dart';
import 'package:api_json/services/services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<List<User>> users;
  AbstractUserService apiService = UserService();
  // List<User>? user;

  @override
  void initState() {
    super.initState();
    users = apiService.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder<List<User>>(
              future: users,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      User user = snapshot.data![index];
                      return ListTile(
                        title: Text(user.name!),
                        subtitle: Text(user.website!),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return const CircularProgressIndicator();
              })
      ),
    );
  }
}
