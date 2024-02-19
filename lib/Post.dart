import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  TextEditingController userIdController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  String? postData;

  submit() async {
    // Parse text inputs to integers
    int userId = int.tryParse(userIdController.text) ?? 0;
    int id = int.tryParse(idController.text) ?? 0;

    final response = await http.post(
      Uri.parse("https://jsonplaceholder.typicode.com/albums"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "userId": userId,
        "id": id,
        "title": titleController.text,
      }),
    );

    if (response.statusCode == 201) {
      setState(() {
        postData = response.body;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter API'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: userIdController,
              decoration: InputDecoration(
                hintText: 'UserID',
              ),
              validator: (input) {
                if (input!.isEmpty) {
                  return "Input can not be Empty";
                }
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: idController,
              decoration: InputDecoration(
                hintText: 'ID',
              ),
              validator: (input) {
                if (input!.isEmpty) {
                  return "Input can not be Empty";
                }
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Title',
              ),
              validator: (input) {
                if (input!.isEmpty) {
                  return "Input can not be Empty";
                }
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: submit,
              child: Text('Submit'),
            ),
            SizedBox(height: 20),
            if (postData != null)
              Text(
                'Posted Data: $postData',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
