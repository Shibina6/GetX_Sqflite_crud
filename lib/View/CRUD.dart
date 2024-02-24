import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/GetX_Controller.dart';
import 'Home.dart';

class CRUD extends StatelessWidget {
  String id;
  String from;
   CRUD({super.key,required this.id, required this.from});

  final GetX_Controller getx = Get.put(GetX_Controller());
   final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          centerTitle: true,
          title: const Text("Students",style: TextStyle(color: Colors.white54),),
          elevation: 5,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()
          {
            if (_formKey.currentState!.validate())
              {
                getx.AddStudent(id,from);
                getx.getStudent();
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home() ));
              }
          },
          child: Text("SAVE",style: TextStyle(color: Colors.white54)),
          backgroundColor: Colors.white24,
        ),
        body:  SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: MediaQuery.of(context).size.width ,
                child:
                   Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child:
                           TextFormField(
                            controller: getx.nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "*Required field";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              isDense: true,
                              hintText: 'Name',
                              hintStyle:
                              TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white30,),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              filled: true,
                              fillColor: Colors.white24,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white24)),
                              disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white24)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white24)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                            ),
                            style:
                            const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white60,),
                          ),

                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child:
                            TextFormField(
                              controller: getx.ageController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "*Required field";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                isDense: true,
                                hintText: 'Age',
                                hintStyle:
                                TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white30,),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                filled: true,
                                fillColor: Colors.white24,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white24)),
                                disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white24)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white24)),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                              ),
                              style:
                              const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white60,),
                            ),

                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child:
                            TextFormField(
                              controller: getx.classController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "*Required field";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                isDense: true,
                                hintText: 'Class',
                                hintStyle:
                                TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white30,),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                filled: true,
                                fillColor: Colors.white24,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white24)),
                                disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white24)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white24)),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                              ),
                              style:
                              const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white60,),
                            ),

                      ),
                    ],
                  ),

              ),
            ),
          ),
        ),
      ),
    );
  }
}
