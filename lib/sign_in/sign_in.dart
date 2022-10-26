
import 'package:flutter/material.dart';
import 'package:video_360/data/model/register_model.dart';
import 'package:video_360/domain/usecase/register_use_case.dart';
import 'package:video_360/application/injectors.dart';
import 'package:video_360/sign_in/validator.dart';
import 'package:video_360/home/widgets.dart';

import '../home/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController proficiencyController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: Padding(
      //     padding: const EdgeInsets.only(top: 10, left: 23.0),
      //     child: Image.asset(
      //       'assets/images/metas.png',
      //       height: height * 0.06,
      //     ),
      //   ),
      //   elevation: 0,
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 18.0, right: 18.0, top: 8.0, bottom: 8.0),
            child: Stack(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.05,
                      ),
                      SizedBox(
                        height: height * 0.06,
                        child: Image.asset(
                          "assets/images/metas.png",
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Image.asset(
                        "assets/images/login.png",
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      defaultFormField(
                          controller: nameController,
                          validator: Validator.validateName,
                          type: TextInputType.name,
                          label: "Full Name",
                          prefixIcon: null),
                      SizedBox(
                        height: height * 0.018,
                      ),
                      defaultFormField(
                        controller: proficiencyController,
                        validator: Validator.validateProficiency,
                        type: TextInputType.name,
                        label: "Proficiency",
                        hint: "ex: engineer, student, graduate",
                        prefixIcon: null,
                      ),
                      SizedBox(
                        height: height * 0.018,
                      ),
                      defaultFormField(
                        controller: phoneController,
                        validator: Validator.validatePhone,
                        type: TextInputType.phone,
                        label: "Phone Number",
                        prefixIcon: null,
                      ),
                      SizedBox(
                        height: height * 0.028,
                      ),
                      OutlinedButton(
                          clipBehavior: Clip.antiAlias,
                          onPressed: userRegister,
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            side: const BorderSide(
                                width: 1.0, color: Colors.orangeAccent),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 14,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void userRegister() async {
    if (formKey.currentState!.validate()) {
      RegisterModel registerModel = RegisterModel(
          name: nameController.text,
          proficiency: proficiencyController.text,
          phoneNumber: phoneController.text);
      final RegisterUsecase registerUsecase = instance<RegisterUsecase>();
      registerUsecase.execute(registerModel);
      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => const HomeScreen()),
        (route) => false,
      );
    } else {
      return;
    }
  }
}
