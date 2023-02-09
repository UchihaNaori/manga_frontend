import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_read/common/utils/extensions.dart';
import 'package:manga_read/controller/register_controller.dart';
import 'package:manga_read/routers/router.dart';

class Register extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Image.asset(
          //   //TODO update this
          //   'assets/background.jpg',
          //   fit: BoxFit.fill,
          //   height: double.infinity,
          //   width: double.infinity,
          // ),
          // Container(
          //   height: double.infinity,
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //           begin: Alignment.bottomCenter,
          //           end: Alignment.topCenter,
          //           colors: [
          //             Colors.black.withOpacity(.9),
          //             Colors.black.withOpacity(.1),
          //           ])),
          // ),
          Form(
              key: controller.registerFromKey,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 27.0,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      'Join Mr BookWorm!',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                            width: double.infinity,
                            margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  height: 22,
                                  width: 22,
                                  child: const Icon(
                                    Icons.person,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            height: 50,
                            margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                            child: TextFormField(
                              controller: controller.name,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                  hintText: 'Name',
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                  )),
                              style:
                                  const TextStyle(fontSize: 16, color: Colors.black),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please type your name!';
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
                            margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  height: 22,
                                  width: 22,
                                  child: const Icon(
                                    Icons.email,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            height: 50,
                            margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                            child: TextFormField(
                              controller: controller.email,
                              textAlign: TextAlign.center,
                              decoration:const InputDecoration(
                                  hintText: 'Email',
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.black)),
                              style:
                                  const TextStyle(fontSize: 16, color: Colors.black),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please type your email!';
                                }

                                return null;
                              },
                            )),
                      ],
                    ),
                    //phonenumber
                    const SizedBox(
                      height: 16,
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                            width: double.infinity,
                            margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  height: 22,
                                  width: 22,
                                  child: const Icon(
                                    Icons.phone,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            height: 50,
                            margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                            child: TextFormField(
                              controller: controller.phone,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                  hintText: 'Mobile Number',
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.black)),
                              style:
                                  const TextStyle(fontSize: 16, color: Colors.black),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please type your phone number!';
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
                            margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  height: 22,
                                  width: 22,
                                  child: const Icon(
                                    Icons.vpn_key,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                                // if (true)
                              ],
                            )
                          ),
                          Container(
                            height: 50,
                            margin: const EdgeInsets.fromLTRB(30, 0, 50, 0),
                            padding: const EdgeInsets.fromLTRB(0, 10, 20, 5),
                            child: Obx(() => TextFormField(
                              controller: controller.password,
                              textAlign: TextAlign.center,
                              obscureText: controller.hidePassword.value,
                              decoration: const InputDecoration(
                                  hintText: 'Password',
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                  )),
                              style:
                                  const TextStyle(fontSize: 16, color: Colors.black),

                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please type your password!';
                                } else if(value.length <= 6) {
                                  return 'Password must be more than 6 characters!';
                                }

                                return null;
                              },
                            ))
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 82.0.wp),
                            child: IconButton(
                              onPressed: () {
                                print('aaa');
                              },
                              icon: const Icon(Icons.visibility)
                          ),)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(50)),
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: InkWell(
                        onTap: (() {
                           if (controller.registerFromKey.currentState!.validate()) {

                           }
                        }),
                        child: const Center(
                          child: Text(
                          'Register',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                      ))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: const Center(
                          child: Text(
                        "Already have an account",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      )),
                    ),
                    InkWell(
                      onTap: () {
                        Get.offNamed(RouterNavigation.login);
                      },
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: const Center(
                            child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )),
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
