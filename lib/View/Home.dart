import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/GetX_Controller.dart';
import 'CRUD.dart';

class Home extends StatelessWidget {
   Home({super.key});




  @override
  Widget build(BuildContext context) {
    final GetX_Controller getx = Get.put(GetX_Controller());
    getx.getStudent();
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        //backgroundColor: const Color(0xff4E4C4C),
        appBar: AppBar(
          elevation: 5,
          //shape: const BeveledRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(5))),
          backgroundColor: Colors.blueGrey[900],
          //backgroundColor: Color(0xff668698),
          centerTitle: true,
          title: const Text("Students",style: TextStyle(color: Colors.white60, fontWeight: FontWeight.bold),),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CRUD(from: "NEW", id: "",)));
            },
          child: const Icon(Icons.add, size: 30,
            color: Colors.white54,),
          backgroundColor: Colors.white12,
          elevation: 10,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            child: Obx( ()=>
               ListView.builder(
                  itemCount: getx.studentList.length,
                  itemBuilder: (context, index){
                return Card(
                  color: Colors.white12,
                  child: SizedBox(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Column(
                                children: [
                                  Text("NAME",style: TextStyle(color: Colors.white54),),
                                  Text("AGE",style: TextStyle(color: Colors.white54),),
                                  Text("CLASS",style: TextStyle(color: Colors.white54),),
                                ],
                              ),
                              const SizedBox(width: 10,),
                              const Column(
                                children: [
                                  Text(":",style: TextStyle(color: Colors.white54),),
                                  Text(":",style: TextStyle(color: Colors.white54),),
                                  Text(":",style: TextStyle(color: Colors.white54),),
                                ],
                              ),
                              const SizedBox(width: 10,),

                                 Column(
                                  children: [
                                    Text(getx.studentList[index].name.toString(),style: const TextStyle(color: Colors.white54),),
                                    Text(getx.studentList[index].age.toString(),style: const TextStyle(color: Colors.white54),),
                                    Text(getx.studentList[index].CLASS.toString(),style: const TextStyle(color: Colors.white54),),
                                  ],
                                ),


                            ],
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                IconButton(
                                    alignment: Alignment.topRight,
                                    onPressed: ()
                                    {
                                      getx.edit_Student(getx.studentList[index].id.toString());
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => CRUD(from: "EDIT", id: getx.studentList[index].id.toString(),)));
                                    },
                                    icon: const Icon(Icons.edit_square,size: 20,color: Colors.grey,),
                                    padding: EdgeInsets.zero,
                                  visualDensity: VisualDensity.comfortable,
                                ),
                                IconButton(
                                    alignment: Alignment.topLeft,
                                    onPressed: ()
                                    {
                                      getx.delete_Student(getx.studentList[index].id.toString());
                                    },
                                    icon: const Icon(Icons.delete, color: Colors.red,size: 23,),
                                    padding: EdgeInsets.zero
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
