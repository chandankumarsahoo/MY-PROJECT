import 'package:flutter/material.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:what_can_i_do/Models/Models.dart';
import 'package:what_can_i_do/screens/Add_Task_Screens.dart';
import 'package:what_can_i_do/utils/const.dart';
import 'package:provider/provider.dart';
import 'package:what_can_i_do/Provider/App_Provider.dart';



class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color:Colors.blueAccent.shade400 ,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor:myRed ,
          elevation: 0,
          title:const Text("ToDo App"),
          centerTitle: true,
        ),
        body:Consumer<todoProvider>(builder:(context,provider,child) {
          return ListView.builder(
              itemCount: provider.Task.length,
              itemBuilder: (context,index){
                return CheckboxListTile(
                  value: provider.Task[index].doneOrNot,
                  onChanged: (value){
                    provider.setDoOrNotAtTheIndex(index, value!);
                    // setState((){
                    // provider.setDoorNotAtTheIndex(index,value!);
                    // provider.Task[index].doneOrNot = value!;
                    // });
                  },
                  activeColor: Color(0xFFFA5463),
                  title: provider.Task[index].doneOrNot?
                  Text(provider.Task[index].title,
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  )
                      :Text(provider.Task[index].title,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                );
              }
          );
        },),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          onPressed: (){
            Navigator.push(context,
              MaterialPageRoute(builder:(context)=> Add_Task_Screens ()),
            );
          },
          child: Icon(Icons.add),
        ) ,
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
    );
  }
}
