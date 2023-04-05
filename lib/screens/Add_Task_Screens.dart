import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:what_can_i_do/utils/const.dart';
import 'package:what_can_i_do/Provider/App_Provider.dart';
import 'package:provider/provider.dart';





class Add_Task_Screens extends StatelessWidget {
   Add_Task_Screens({Key? key}) : super(key: key);
late String _Task ="";
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: myRed,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: myRed,
          title: Text("Enter Your Task"),
          elevation: 0,
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("Enter Your Task",
              style: TextStyle(
                  color: myRed,
                  fontSize: 22
              ),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 300,
              width: 300,
              padding: EdgeInsets.all(10),
              decoration:BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)
              ),
              // alignment: Alignment.center,
              child: TextField(
                onChanged: (value){
                  // print(value);
                  _Task = value;
                },
                autofocus: true,
                style: TextStyle(color: Colors.grey),

                decoration: InputDecoration(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none

                ),


              ),

            )

            //SizedBox(height: 10,),



          ],
        ),
        floatingActionButton: Consumer<todoProvider>(builder: (context,provider,child){
          return GestureDetector(
            onTap:() {
              provider.setANewTask(_Task);
              Navigator.pop(context);
            },
            child: Container(
              height: 45,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text("submit",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,

                ),
              ),


            ),

          );
        },),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    ),
  );
  }
}
