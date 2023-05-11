import 'package:flutter/material.dart';
import 'package:todo_app/component/customColors.dart';
import 'package:todo_app/model/todoModel.dart';
import 'package:todo_app/service/GetTodoApiService.dart';

import 'customFont.dart';

class CustomCard extends StatelessWidget {
  CustomCard({Key? key}) : super(key: key);
  final todos = TodoModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: GetTodoApi.todoModel?.data?.length ?? 0,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 12),
              child: Card(
                elevation: 5,
                color: CustomColor.bgColor,
                child: Container(
                    padding: EdgeInsets.all(16),
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
                                  Icons.view_list,
                                  color: CustomColor.primaryColor,
                                  size: 30,
                                )),
                            Expanded(
                                flex: 8,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${GetTodoApi.todoModel?.data![index].title}",
                                      style: myFont(
                                          20,
                                          1,
                                          0,
                                          CustomColor.primaryColor,
                                          FontWeight.normal),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Start Date:${GetTodoApi.todoModel?.data?[index].startDate}",
                                          style: myFont(
                                              16,
                                              1,
                                              0,
                                              CustomColor.primaryColor,
                                              FontWeight.normal),
                                        ),
                                        Text(
                                          "End Date:${GetTodoApi.todoModel?.data?[index].endDate}",
                                          style: myFont(
                                              16,
                                              1,
                                              0,
                                              CustomColor.primaryColor,
                                              FontWeight.normal),
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                            Expanded(
                              flex: 2,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.timer,
                                    color: CustomColor.primaryColor,
                                    size: 30,
                                  )),
                            ),
                          ],
                        )
                      ],
                    )),
              ),
            );
          }),
    );
  }
}
