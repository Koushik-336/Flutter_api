import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ShowData extends StatefulWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {

  final url = 'https://jsonplaceholder.typicode.com/posts';
  var _postsJson = [];
  void fetchposts  () async {
    try {
      final response = await get(Uri.parse(url));
      final jasonData = jsonDecode(response.body) as List;

      setState(() {
        _postsJson = jasonData;
      });
    }catch (err){

    }
  }

  @override
  void initState(){
    super.initState();
    fetchposts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter API'),
      ),
      body: ListView.builder(
        itemCount: _postsJson.length,
        itemBuilder: (context, i) {
          final post =  _postsJson[i];

          return  Text("\n\nUserID: ${post["userId"]}\nID: ${post["id"]}\nTitle: ${post["title"]}\nBody: ${post["body"]}\n\n");

        }
        ,
      ),
    );
  }
}
