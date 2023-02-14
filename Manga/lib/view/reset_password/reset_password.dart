import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_read/controller/reset_password_controller.dart';
import '../../common/utils/extensions.dart';
import '../../common/values/const.dart';

class ResetPassword extends StatelessWidget {
  ResetPasswordController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon:const Icon(Icons.arrow_back, size: 30,color: Constant.mainColor,),
          onPressed: () {
            Get.back();
          },
        )
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Center(
              heightFactor: 1.5,
              child: Text(
                'Reset password',
                style: TextStyle(
                  fontSize: 18.0.sp,
                  fontWeight: FontWeight.bold,
                  color: Constant.mainColor
                )
              )
            ),
            Form(
              key: controller.resetPasswordKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0.wp),
                child: Container(
                  height: 80.0.hp,
                  child: ListView(
                    children: [
                      SizedBox(height: 4.0.hp,),
                      Stack(
                        children:[
                        Container(
                          height: 6.5.hp,
                          width: 76.0.wp,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color:const Color.fromRGBO(221, 232, 242, 1))
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0.wp),
                          child: GetBuilder<ResetPasswordController>(builder: (controller) =>Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 57.0.wp,
                                child: TextFormField(
                                  controller: controller.oldPass,
                                  obscureText: !controller.showOldPass.value,
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                    hintText: 'Current password',
                                    focusedBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      fontSize: 13.0.sp,
                                      color:const Color.fromRGBO(69, 69, 69, 1),
                                    )
                                  ),
                                  style:
                                      TextStyle(fontSize: 13.0.sp, color: Colors.black),
                                  validator: (value) {
                                    if(value == null || value.trim().isEmpty) {
                                      return 'Please type your current password';
                                    }

                                    return null;
                                  } ,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 0.3.hp),
                                child: IconButton(
                                  icon: Icon(controller.showOldPass.value ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                                  onPressed: () {
                                    controller.setShowOldPass(!controller.showOldPass.value);
                                  },
                                ),
                              )
                            ],
                          ))
                        ),]
                      ),

                      SizedBox(height: 2.5.hp,),

                      Stack(
                        children:[
                        Container(
                          height: 6.5.hp,
                          width: 76.0.wp,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color:const Color.fromRGBO(221, 232, 242, 1))
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0.wp),
                          child: GetBuilder<ResetPasswordController>(builder: (controller) =>Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 57.0.wp,
                                child: TextFormField(
                                  controller: controller.newPass,
                                  obscureText: !controller.showNewPass.value,
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                    hintText: 'New password',
                                    focusedBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      fontSize: 13.0.sp,
                                      color:const Color.fromRGBO(69, 69, 69, 1),
                                    )
                                  ),
                                  style:
                                      TextStyle(fontSize: 13.0.sp, color: Colors.black),
                                  validator: (value) {
                                    if(value == null || value.trim().isEmpty) {
                                      return 'Please type your new password';
                                    }

                                    return null;
                                  } ,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 0.3.hp),
                                child: IconButton(
                                  icon: Icon(controller.showNewPass.value ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                                  onPressed: () {
                                    controller.setShowNewPass(!controller.showNewPass.value);
                                  },
                                ),
                              )
                            ],
                          ))
                        ),]
                      ),

                      SizedBox(height: 2.5.hp,),

                      Stack(
                        children: [
                          Container(
                            height: 6.5.hp,
                            width: 76.0.wp,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color:const Color.fromRGBO(221, 232, 242, 1))
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0.wp),
                            child: GetBuilder<ResetPasswordController>(builder: (controller)=> Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 57.0.wp,
                                  child: TextFormField(
                                    controller: controller.confirmPass,
                                    obscureText: !controller.showConfirmPass.value,
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      hintText: 'Confirm new password',
                                      focusedBorder: InputBorder.none,
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        fontSize: 13.0.sp,
                                        color:const Color.fromRGBO(69, 69, 69, 1),
                                      )
                                    ),
                                    style:
                                        TextStyle(fontSize: 13.0.sp, color: Colors.black),
                                    validator: (value) {
                                      if (value == null || value.trim().isEmpty) {
                                        return 'Please type confirm password';
                                      } else if (value != controller.newPass.text) {
                                        return 'Confirm password not match';
                                      }

                                      return null;
                                    } ,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 0.3.hp),
                                  child: IconButton(
                                    icon: Icon(controller.showConfirmPass.value ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                                    onPressed: () {
                                      controller.setShowConfirmPass(!controller.showConfirmPass.value);
                                    },
                                  ),
                                )
                              ],
                            ),),
                          ),
                        ],
                      ),

                      SizedBox(height: 8.0.hp,),
                      Container(
                        width: 40.0.wp,
                        height: 6.5.hp,
                        margin: EdgeInsets.symmetric(horizontal: 10.0.wp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:Constant.mainColor
                        ),
                        child: InkWell(
                          onTap: () {
                            if (controller.resetPasswordKey.currentState!.validate()) {
                              controller.resetPass(controller.newPass.text, controller.oldPass.text);
                              // true ? EasyLoading.showSuccess('Reset password successfully') : EasyLoading.showError('wrong password');
                            }
                          },
                          child: Center(
                            child: Text(
                              'Reset password',
                              style: TextStyle(
                                fontSize: 18.0.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                )
              ),
            )
          ],
        ),
      )
    );
  }

}