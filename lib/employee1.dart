import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Employee1 extends StatefulWidget {
  const Employee1({super.key, required this.docid});
  final String docid;
  

  @override
  State<Employee1> createState() => _Employee1State();
}

class _Employee1State extends State<Employee1> {

  TextEditingController namecontroler1 = TextEditingController();
  TextEditingController agecontroler1 = TextEditingController();
  TextEditingController locationcontroler1 = TextEditingController();
  
  
  
  update(String name,String age,String location)async{
    return await FirebaseFirestore.instance.collection("employee").doc(widget.docid).update({"name":name,"age":age,"location":location});
    
  }
  @override
  Widget build(BuildContext context) {
    
    
    
    
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("employee").doc(widget.docid).snapshots(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              namecontroler1.text=snapshot.data!["name"];
              agecontroler1.text=snapshot.data!["age"];
              locationcontroler1.text=snapshot.data!["location"];

              return Container(

                margin: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15.0),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: namecontroler1,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Age",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15.0),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: agecontroler1,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Location",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15.0),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: locationcontroler1,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(child: ElevatedButton(onPressed: (){

                      update(namecontroler1.text, agecontroler1.text, locationcontroler1.text);


                      Navigator.of(context).pop();
                    }, child: Text("update")))

                  ],
                ),
              );

            }
            else{
              return SizedBox();
            }

          }
        ),
      ),
    );
  }
}
