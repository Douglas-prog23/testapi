import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class TestHttp extends StatefulWidget {
  const TestHttp({super.key, required this.title});

  final String title;

  @override
  State<TestHttp> createState() => _TestHttpState();
}

class _TestHttpState extends State<TestHttp> {
  void _incrementCounter() {
    setState(() {});
  }

  void prueba() {
    print("prueba");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.delete),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prueba();
    getBored();
    peticionhttp();
  }

  void getBored() async {
    try {
      //Peticion API 1
      var url = Uri.parse('https://www.boredapi.com/api/activity');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = convert.jsonDecode(response.body);
        print(data);
      } else {
        print("Error${response.statusCode}");
      }
    } catch (e) {
      print("Error ${e}");
    }
  }

  void peticionhttp() async {
    var url = Uri.parse('https://reqres.in/api/users?page=2');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      print(jsonResponse);
    } else {
      print('Fail status: ${response.statusCode}.');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
