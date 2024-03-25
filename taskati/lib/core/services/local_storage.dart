import 'package:hive/hive.dart';

class AppLocalStorage {

  static late Box userBox;

  init(){
    userBox = Hive.box('UserBox');
  }

  static cashUserData(key,value){
   userBox.put(key,value);
  }

  static dynamic getcasUserhData(key){
   return userBox.get(key);
  }
}