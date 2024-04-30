import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: FutureBuilder(future: Hive.openBox('name'),
              builder: (context,  snapshot) {
              return Column(children: [
                Text('data'),
                Text(snapshot.data?.get('named')),
                Text(snapshot.data?.get('pro')['developer']),
                Text(snapshot.data?.get('pro')['developers']),
                Text(snapshot.data?.get('pro')['developerrss']),
                Text(snapshot.data!.get('lists').toString())
              ],);
              },),
          ),

          Expanded(
            flex: 1,
            child: Center(child: OutlinedButton(onPressed: ()async{
              var box =await Hive.openBox('name');
              box.put('named', 'Iftekhar Ahmed');
              box.put('pro', {
                'developer': 'Mobile Apps',
                'developers': 'Web Apps',
                'developerrss': 'Window Apps'
              });
              box.put('lists', [
                'Pakistan','India','Australia','Saudi-Arabia','Afghanistan','America'
              ]);
              var getval = box.get('named');
              print(getval);

              var getlistelement = box.get('pro')['developer'];
              print(getlistelement);

            }, child: Text('Add Data to list')),),
          ),
        Expanded(
          flex: 1,
          child: Center(
            child: OutlinedButton(onPressed: (){
              Navigator.pushNamed(context, '/graph');
            }, child: Text('Move to Graph Screen')),
          ),
        )
      ],),
    );
  }
}
