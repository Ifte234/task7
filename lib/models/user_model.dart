
import 'package:hive/hive.dart';
part 'user_model.g.dart';
@HiveType(typeId: 0)
class UserModel extends HiveObject{
  @HiveField(0)
  String Name;
  @HiveField(1)
  int id;
  UserModel({required this.Name,required this.id});
}