import 'package:hive/hive.dart';
import 'package:taskati/features/add-task/model/task_model.dart';

class AppLocalStorage {

  static late Box userBox;
  static late Box<TaskModel> taskBox;

  init(){
    userBox = Hive.box('UserBox');
    taskBox = Hive.box<TaskModel>('TaskBox');
  }

  static cashUserData(key,value){
   userBox.put(key,value);
  }

  static dynamic getcasUserhData(key){
   return userBox.get(key);
  }

  static cashTaskData(key,value){
   taskBox.put(key,value);
  }

  static TaskModel getcashTaskData(key){
   return taskBox.get(key)!;
  }
}