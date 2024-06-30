import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoro/utils/app_colors.dart';
import 'package:todoro/widgets/button_widget.dart';
import 'package:todoro/widgets/task_widget.dart';

import '../controllers/data_controller.dart';

class AllTask extends StatelessWidget {
  const AllTask({super.key});
  loadData() async {
    await Get.find<DataController>().getData();
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DataController().myData);
    loadData();
    List my_Data = ['hard work','life is hell'];
    final leftEditIcon = Container(
        margin: const EdgeInsets.only(bottom: 10),
        color: const Color(0xFF2e3253),
        alignment: Alignment.centerLeft,
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ));
    final rightEditIcon = Container(
        margin: const EdgeInsets.only(bottom: 10),
        color: Color.fromARGB(255, 176, 95, 95),
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ));
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(left: 20, top: 60),
                alignment: Alignment.topLeft,
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height / 3.2,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/header1.jpg"))),
                child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back,
                        color: AppColors.secondaryColor))),
            Container(
              child: Row(
                children: [
                    const SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.home,
                    color: AppColors.secondaryColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.5),
                        color: Colors.black),
                    child: Icon(Icons.add, color: Colors.white, size: 20),
                  ),
                    const SizedBox(
                    width: 220,
                  ),
                  Icon(
                    Icons.calendar_month,
                    color: AppColors.secondaryColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text("2",
                      style: TextStyle(
                          fontSize: 20, color: AppColors.secondaryColor)),
                ],
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: my_Data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    background: leftEditIcon,
                    secondaryBackground: rightEditIcon,
                    onDismissed: (DismissDirection direction) {},
                    confirmDismiss: (DismissDirection direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            barrierColor: Colors.transparent,
                            context: context,
                            builder: (_) {
                              return Container(
                                height: 550,
                                width: 600,
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF2e3253).withOpacity(0.4),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ButtonWidget(
                                          backgroundcolor: AppColors.mainColor,
                                          text: "View",
                                          textColor: Colors.white),
                                      SizedBox(height: 20),
                                      ButtonWidget(
                                          backgroundcolor: AppColors.mainColor,
                                          text: "Edit",
                                          textColor: Colors.white)
                                    ],
                                  ),
                                ),
                              );
                            });
                        return false;
                      }
                      return Future.delayed(Duration(seconds: 1),
                          () => direction == DismissDirection.endToStart);
                    },
                    key: ObjectKey(index),
                    child: Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10),
                        child: TaskWidget(
                          text: my_Data[index],
                          color: Colors.blueGrey,
                        )),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
