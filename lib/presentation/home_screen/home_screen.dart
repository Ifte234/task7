import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
        centerTitle: true,
      ),
      body: Column(children: [
        OutlinedButton(onPressed: (){
          Navigator.pushNamed(context, '/graph');
        }, child: Text('Move to Graph Screen'))
      ],),
    );
  }
}
