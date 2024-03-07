import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_2/models/user_model.dart';
import 'package:http/http.dart' as http;

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  List<UserModels> userList = [];

  Future<List<UserModels>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        userList.add(UserModels.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, AsyncSnapshot<List<UserModels>> snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  return ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              ResuableRow(title: 'Name', value: snapshot.data![index].name.toString()),
                              ResuableRow(title: 'username', value: snapshot.data![index].username.toString()),
                              ResuableRow(title: 'Id', value: snapshot.data![index].id.toString()),
                              ResuableRow(title: 'Address', value: snapshot.data![index].address!.city.toString()),
                              ResuableRow(title: 'Street', value: snapshot.data![index].address!.street.toString()),
                            ]),
                          ),
                        );
                      });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class ResuableRow extends StatelessWidget {
  String title, value;
  ResuableRow({
    super.key, required this.title, required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
