import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task7/data/boxes.dart';
import 'package:task7/models/user_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
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
            child: FutureBuilder(
              future: Hive.openBox('name'),
              builder: (context, snapshot) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(snapshot.data?.get('named')),
                      subtitle: Text(snapshot.data?.get('pro')['developer']),
                      trailing: InkWell(child: Icon(Icons.edit)),
                    ),
                    Text('data'),
                    Text(snapshot.data?.get('pro')['developers']),
                    Text(snapshot.data?.get('pro')['developerrss']),
                    Text(snapshot.data!.get('lists').toString())
                  ],
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: OutlinedButton(
                  onPressed: () async {
                    var box = await Hive.openBox('name');
                    box.put('named', 'Iftekhar Ahmed');
                    box.put('pro', {
                      'developer': 'Mobile Apps',
                      'developers': 'Web Apps',
                      'developerrss': 'Window Apps'
                    });
                    box.put('lists', [
                      'Pakistan',
                      'India',
                      'Australia',
                      'Saudi-Arabia',
                      'Afghanistan',
                      'America'
                    ]);
                    var getval = box.get('named');
                    print(getval);

                    var getlistelement = box.get('pro')['developer'];
                    print(getlistelement);
                  },
                  child: Text('Add Data to list')),
            ),
          ),
          Expanded(child: InkWell(
            onLongPress: (){_showDeleteDialog(context);},
            child: ValueListenableBuilder<Box<UserModel>>(
              valueListenable: Boxes.getBoxData().listenable(),
              builder: (context,box,_){
                Hive.openBox('user');
                var data =box.values.toList().cast<UserModel>();
                return ListView.builder(
                    itemCount: box.length,
                    itemBuilder: (context,index){
                 return Card(
                   child: Column(
                     children: [
                       Text(data[index].Name),
            
                     ],
                   ),
                 );
                });
              },
            ),
          )),
          Expanded(
            flex: 1,
            child: Center(
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/graph');
                  },
                  child: Text('Move to Graph Screen')),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showMyDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _showMyDialog(context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Add Data to Lists'),
                SizedBox(
                  height: 12,
                ),
                MyTextField(
                  labelText: 'Enter Your Id',
                  controller: idController,
                ),
                SizedBox(
                  height: 12,
                ),
                MyTextField(
                  labelText: 'Enter Your Name',
                  controller: nameController,
                ),
              ],
            ),
          ),
          actions: [
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel')),
            OutlinedButton(onPressed: () {
              final data = UserModel(
                  Name: nameController.text,
                  id: int.parse(idController.text));
              var box = Boxes.getBoxData();
              box.add(data);
              data.save();
              print(data.save());
              nameController.clear();
              idController.clear();

            }, child: Text('Add'))
          ],
        );
      },
    );
  }
  Future<void> _showDeleteDialog(context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Add Data to Lists'),
                SizedBox(
                  height: 12,
                ),
                MyTextField(
                  labelText: 'Enter Your Id',
                  controller: idController,
                ),
                SizedBox(
                  height: 12,
                ),
                MyTextField(
                  labelText: 'Enter Your Name',
                  controller: nameController,
                ),
              ],
            ),
          ),
          actions: [
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Delete')),
            OutlinedButton(onPressed: () {
              final data = UserModel(
                  Name: nameController.text,
                  id: int.parse(idController.text));
              var box = Boxes.getBoxData();
              box.add(data);
              data.save();
              print(data.save());
              nameController.clear();
              idController.clear();

            }, child: Text('Update'))
          ],
        );
      },
    );
  }
}

class MyTextField extends StatelessWidget {
  final labelText;
  final hintText;
  final TextEditingController controller;
  const MyTextField({
    super.key,
    required this.labelText,
    this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black12,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
