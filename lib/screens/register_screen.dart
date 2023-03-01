import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:task_one/screens/login_screen.dart';
import 'package:task_one/widgets/my_navigator.dart';

import '../widgets/custom_textformfeild.dart';
import 'animated_screen.dart';
import '../widgets/custom_buttom.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPassword = true;
  bool isPasswordConfirm = true;
  final fullnamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      //* use appBar to change color of statusBar */
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          elevation: 0.0,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.purple),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(children: [
            //* custom curve */
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                color: Colors.purple,
                height: height * 0.25,
                child: const Center(
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            CustomTextFormFeild(
              controller: fullnamecontroller,
              validator: (value) {
                if (value!.isEmpty) {
                  return "please enter full name";
                }
              },
              hinttext: "Enter your name",
              labeltext: "Full Name",
              obsecure: false,
              prefixIcon: Icons.person,
              textInputType: TextInputType.name,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            //* Email Feild */
            CustomTextFormFeild(
              controller: emailcontroller,
              validator: (value) {
                if (value!.isEmpty) {
                  return "please enter required email";
                }
              },
              hinttext: "Enter your email",
              labeltext: "Email",
              obsecure: false,
              prefixIcon: Icons.email,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            //* Phone Number Feild */
            CustomTextFormFeild(
              controller: phonecontroller,
              validator: (value) {
                if (value!.isEmpty) {
                  return "please enter required phone number";
                }
              },
              hinttext: "Enter your phone number",
              labeltext: "Phone number",
              obsecure: false,
              prefixIcon: Icons.phone,
              textInputType: TextInputType.phone,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            //* Password Feild */

            CustomTextFormFeild(
              controller: passwordcontroller,
              validator: (value) {
                if (value!.isEmpty) {
                  return "please enter required password";
                }
              },
              hinttext: "Enter your password",
              labeltext: "password",
              obsecure: isPassword,
              prefixIcon: Icons.lock,
              suffixIcon: IconButton(
                  icon: isPassword
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  }),
              textInputType: TextInputType.visiblePassword,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            //* Confirm Password Feild */

            CustomTextFormFeild(
              controller: confirmpasswordcontroller,
              validator: (value) {
                if (value!.isEmpty) {
                  return "please enter required password";
                }
              },
              hinttext: "Confirm your password",
              labeltext: "Confirm password",
              obsecure: isPasswordConfirm,
              prefixIcon: Icons.lock,
              suffixIcon: IconButton(
                  icon: isPasswordConfirm
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      isPasswordConfirm = !isPasswordConfirm;
                    });
                  }),
              textInputType: TextInputType.visiblePassword,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SizedBox(
              height: height * 0.06,
              width: double.infinity,
              child: CustomButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    MyNavigator(context: context, widget: AnimatedScreen());
                  }
                  ;
                },
                buttonColor: Colors.purple,
                text: "Register",
                textColor: Colors.white,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SizedBox(
              height: height * 0.06,
              width: double.infinity,
              child: CustomButton(
                onPressed: () {
                  MyNavigator(context: context, widget: LoginScreen());
                },
                buttonColor: Colors.white,
                text: "Login",
                textColor: Colors.purple,
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    Path path = Path();
    path.lineTo(0, height - 40);
    path.quadraticBezierTo(width * 0.25, height - 50, width * 0.5, height - 30);
    path.quadraticBezierTo(width * 0.75, height - 10, width, height - 35);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
