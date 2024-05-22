import 'package:hive/hive.dart';
import 'package:task7/models/user_model.dart';

class Boxes{

  static Box<UserModel> getBoxData(){
    Hive.openBox('user');
   var model = Hive.box<UserModel>('user');
   return model;
  }
}