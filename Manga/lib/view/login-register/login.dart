import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:manga_read/controller/login_controller.dart';
import 'package:manga_read/data/user.dart';
import 'package:manga_read/routers/router.dart';

class Login extends GetView<LoginController> {

  @override
  Widget build(BuildContext context) {

    //test feild state
    String email = "";
    String password = "";

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Container(
          //   decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //           begin: Alignment.bottomCenter,
          //           end: Alignment.topCenter,
          //           colors: [
          //             Color.fromARGB(255, 249, 248, 248).withOpacity(.9),
          //             Colors.black.withOpacity(.1),
          //           ])),
          // ),
          Form(
            key: controller.formKey,
            child:Padding(
            padding: EdgeInsets.only(bottom: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 27.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  //TODO update this
                  'Join Mr BookWorm!',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin:const EdgeInsets.only(left: 20),
                              height: 22,
                              width: 22,
                              child:const Icon(
                                Icons.email,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ],
                        )),
                    Container(
                        height: 50,
                        margin:const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding:const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: TextFormField(
                          controller: controller.email,
                          textAlign: TextAlign.center,
                          decoration:const InputDecoration(
                              hintText: 'Email',
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: Colors.black
                              )
                          ),
                          style:const TextStyle(fontSize: 16,
                              color: Colors.black),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please type your email!';
                            }

                            return null;
                          },
                        )),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 22,
                              width: 22,
                              child:const Icon(
                                Icons.vpn_key,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ],
                        )),
                    Container(
                        height: 50,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: TextFormField(
                          obscureText: controller.hidePassword.value,
                          controller: controller.password,
                          textAlign: TextAlign.center,
                          decoration:InputDecoration(
                            hintText: 'Password',
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            hintStyle:const TextStyle(
                                color: Colors.black
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                controller.isHidePasswordIcon(!controller.hidePassword.value);
                              },
                              child: Obx(() => Icon(
                                controller.hidePassword.value ? Icons.visibility : Icons.visibility_off,
                                // semanticLabel:
                                //     true ? 'show password' : 'hide password',
                              ),)
                            )
                          ),
                          style:const TextStyle(fontSize: 16,
                              color: Colors.black),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please type your password!';
                            }

                            return null;
                          },
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: InkWell(
                    onTap: () {
                      controller.checkLogin({'email': controller.email.text, 'password': controller.password.text});
                    },
                    child: Center(
                      child: TextButton(
                          child: const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black),
                        ),
                        onPressed: () {
                          if(controller.formKey.currentState!.validate()) {

                          }
                        },
                      ),
                    ),)
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50)
                  ),
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: const Center(
                      child: Text(
                        "Don't have an account",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black),
                      )),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Container()),
                    // );
                  },
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Get.offNamed(RouterNavigation.register);
                        },
                        child: const Text(
                          "Create account",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )),
                      )
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
