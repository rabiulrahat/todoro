import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoro/utils/app_colors.dart';
import 'package:todoro/widgets/button_widget.dart';
import 'package:todoro/widgets/textfield_widget.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/addtask1.jpg"))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Column(
              children: [
               const  SizedBox(
                  height: 20,
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon:const  Icon(Icons.arrow_back),
                  color: AppColors.secondaryColor,
                ),
              ],
            ),
            Column(
              children: [
                TextFieldWidget(
                    textController: nameController, hintText: 'Task name'),
                const SizedBox(
                  height: 25,
                ),
                TextFieldWidget(
                  textController: detailController,
                  hintText: 'Task detail',
                  borderRadius: 15,
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 25,
                ),
                ButtonWidget(
                    backgroundcolor: AppColors.mainColor,
                    text: "Add",
                    textColor: Colors.white)
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            )
          ],
        ),
      ),
    );
  }
}
