import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:machinetest/employee.dart';

import 'employee1.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  
  
  delect(String id)async{
    await FirebaseFirestore.instance.collection("employee").doc(id).delete();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Employees(),
                ));
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Home",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),
              ),
              Text(
                "page",
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("employee").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print("data");
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data!.docs[index]["name"],
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 20,fontWeight: FontWeight.bold),
                              ),

                              Text(
                                snapshot.data!.docs[index]["age".toString()],
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 20,fontWeight: FontWeight.bold),
                              ),
                              Text(
                                snapshot.data!.docs[index]["location"],
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 20,fontWeight: FontWeight.bold),

                              ),
                              IconButton(

                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                  return  Employee1( docid:snapshot.data!.docs[index].id);
                                  },

                                  ));
                                },

                                  icon: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left:250,),
                                        child: Icon(Icons.edit,color: Colors.deepOrange,),
                                      ),
                                      IconButton(

                                        onPressed: (){
                                          delect(snapshot.data!.docs[index].id);
                                          Fluttertoast.showToast(msg: "delected",backgroundColor: Colors.red);
                                        },
                                        icon: Padding(
                                          padding: const EdgeInsets.only(left: 260),
                                          child: Icon(Icons.delete),
                                        ),
                                       
                                      )
                                    ],
                                  ),
                                  ),

                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return SizedBox();
              }
            }));
  }
}
