import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manga_read/common/utils/extensions.dart';
import 'package:manga_read/routers/router.dart';
import '../../common/values/const.dart';
import '../../controller/login_controller.dart';

class Login extends GetView<LoginController> {
  const Login({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            child: Center(
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Image.asset('assets/images/logo.png', height: 16.0.hp,)
                    ),
                    const SizedBox(height: 50.0),
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.email,
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          contentPadding:
                             const  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                        ),
                        validator: (value) {
                          if ( value == null || value.trim().isEmpty) {
                            return 'Please type your email!';
                          }

                          return null;
                        }),
                    const SizedBox(height: 20.0),
                    Obx(() => TextFormField(
                      controller: controller.password,
                      autofocus: false,
                      obscureText: controller.hidePassword.value,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.isHidePasswordIcon(!controller.hidePassword.value);
                          },
                          child: Obx(() => Icon(
                            controller.hidePassword.value ? Icons.visibility_off : Icons.visibility,
                            // semanticLabel:
                            //     true ? 'show password' : 'hide password',
                          ),)
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please type your password!';
                        }

                        return null;
                      },
                    ),),
                    const SizedBox(height: 15.0),
                    Padding(
                      padding:const EdgeInsets.symmetric(vertical: 16.0),
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Constant.mainColor,
                              borderRadius: BorderRadius.circular(50)),
                          margin: EdgeInsets.fromLTRB(30.0.wp, 0, 30.0.wp, 0),
                          child: InkWell(
                            onTap: () {
                              if (controller.formKey.currentState!.validate()){
                                controller.checkLogin({
                                  'email': controller.email.text,
                                  'password': controller.password.text
                                });
                              }
                            },
                            child: Center(
                              child: TextButton(
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                onPressed: () {
                                  if (controller.formKey.currentState!.validate()) {
                                      controller.checkLogin({
                                        'email' : controller.email.text,
                                        'password': controller.password.text
                                      });
                                  }
                                },
                              ),
                            ),
                          )),
                    ),
                    TextButton(
                      child:const Text(
                        'Forgot password?',
                        style: TextStyle(color: Colors.black54),
                      ),
                      onPressed: () {},
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offNamed(RouterNavigation.register);
                      },
                      child: Text('Not a member? Sign up now',
                          style: TextStyle(color: Colors.black54)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
