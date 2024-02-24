import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_sqlite_crud/Database/Database_connector.dart';
import 'package:getx_sqlite_crud/Model/Student_Model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class GetX_Controller extends GetxController
{
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController classController = TextEditingController();

  final RxList<Student_Model> studentList = <Student_Model>[].obs;

  Future<void> getStudent() async{
    final List<Map<String, dynamic>> std = await DB_helper().queryallRows();
    studentList.clear();
    for(var e in std)
      {
        studentList.add(Student_Model(e['id'], e['name'], e['age'], e['class']));
      }
    clear_Student();
  }

  void AddStudent(String id, String from) async
  {
    HashMap<String, dynamic> student_map = HashMap();

    student_map['name'] = nameController.text;
    student_map['age'] = ageController.text;
    student_map['class'] = classController.text;
    if(from == "NEW")
      {
        student_map['id'] = DateTime.now().millisecondsSinceEpoch.toString();
        await DB_helper().insert_student(student_map);
      }
    else
      {
        await DB_helper().update(id, student_map);
      }
    getStudent();


  }

  Future<void> edit_Student(String id) async
  {
    final List<Map<String, dynamic>> std = await DB_helper().edit(id);
    for(var e in std) {
      nameController.text = e["name"];
      ageController.text = e["age"].toString();
      classController.text = e["class"].toString();
    }
  }

  void clear_Student()
  {
    nameController.clear();
    ageController.clear();
    classController.clear();
  }

  void delete_Student(String id) async
  {
    await DB_helper().delete(id);
    getStudent();
  }



}