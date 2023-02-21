import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'custom_buttom.dart';
import 'custom_textformfeild.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.045),
            child: Column(
              children: [
                //*Full Name Feild */
                CustomTextFormFeild(
                  hinttext: "Enter your name",
                  labeltext: "Full Name",
                  obsecure: false,
                  prefixIcon: const Icon(Icons.person),
                  textInputType: TextInputType.name,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                //* Email Feild */
                CustomTextFormFeild(
                  hinttext: "Enter your email",
                  labeltext: "Email",
                  obsecure: false,
                  prefixIcon: const Icon(Icons.email),
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                //* Phone Number Feild */
                CustomTextFormFeild(
                  hinttext: "Enter your phone number",
                  labeltext: "Phone number",
                  obsecure: false,
                  prefixIcon: const Icon(Icons.phone),
                  textInputType: TextInputType.phone,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                //* Password Feild */

                CustomTextFormFeild(
                  hinttext: "Enter your password",
                  labeltext: "password",
                  obsecure: true,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: const Icon(Icons.visibility_off),
                  textInputType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                //* Confirm Password Feild */

                CustomTextFormFeild(
                  hinttext: "Confirm your password",
                  labeltext: "Confirm password",
                  obsecure: true,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: const Icon(Icons.visibility_off),
                  textInputType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  height: height * 0.06,
                  width: double.infinity,
                  child: CustomButton(
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
                    buttonColor: Colors.white,
                    text: "Login",
                    textColor: Colors.purple,
                  ),
                )
              ],
            ),
          )
        ]),
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
