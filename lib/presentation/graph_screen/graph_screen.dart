import 'package:flutter/material.dart';

class GraphScreen extends StatelessWidget {
  const GraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Graph Screen'),
        centerTitle: true,
      ), body: Column(children: [
      OutlinedButton(onPressed: (){
        Navigator.pushNamed(context, '/new');
      }, child: Text('Move to New Screen'))
    ],),
    );
  }
}
