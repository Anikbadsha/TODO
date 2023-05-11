import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/component/cutomColors.dart';
import 'package:todo_app/model/todoModel.dart';
import 'package:todo_app/service/GetTodoApiService.dart';

import 'customFont.dart';

class CustomCard extends StatelessWidget {
  CustomCard({Key? key}) : super(key: key);
  final todos = TodoModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: GetTodoApi.todoModel?.data?.length ?? 0,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                color: CustomColor.bgColor,
                child: Container(

                    margin: EdgeInsets.only(top: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(

                      children: [
                      Row(
                        children: [
                        Expanded(
                            flex: 2,
                            child: Icon(
                              Icons.task, color: CustomColor.primaryColor,)),
                        Expanded(
                            flex: 7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${GetTodoApi.todoModel?.data![index]
                                    ?.title}", style: myFont(
                                    20, 1, 0, CustomColor.primaryColor,
                                    FontWeight.normal),),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text("Start Date:${GetTodoApi.todoModel
                                      ?.data?[index].startDate}", style: myFont(
                                      16, 1, 0, CustomColor.primaryColor,
                                      FontWeight.normal),),
                                  Text("End Date:${GetTodoApi.todoModel
                                      ?.data?[index].endDate}", style: myFont(
                                      16, 1, 0, CustomColor.primaryColor,
                                      FontWeight.normal),),
                                ],)
                              ],
                            )),
                      ],)
                    ],)),
              );
            }),
      ),
    );
    //   ListTile(
    //       subtitle: Text("Start Time:${GetTodoApi.todoModel?.data?[index].startTime}",style: myFont(12,1,0,CustomColor.primaryColor,FontWeight.normal),),
    //       leading:
    //       trailing:
    //       title:
    // }
  }
}