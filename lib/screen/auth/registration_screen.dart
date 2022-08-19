import 'package:auth_demo/model/user_model.dart';
import 'package:auth_demo/screen/auth/login_screen.dart';
import 'package:auth_demo/screen/home_screem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../widgets/widgets.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController fNController = TextEditingController();
  TextEditingController lNController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  "Create Account..",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  "assets/regi.jpg",
                  height: 180,
                ),
                const SizedBox(height: 20),

                //First Name
                TextFormField(
                  controller: fNController,
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: textInputDecoration.copyWith(
                    label: const Text("First Name"),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                  ),
                  validator: (value) {
                    if (fNController.text.isEmpty) {
                      return "Please Enter a First Name ";
                    }
                  },
                  onSaved: (newValue) => fNController.text = newValue!,
                ),
                const SizedBox(height: 8),

                //Last Name
                TextFormField(
                  controller: lNController,
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: textInputDecoration.copyWith(
                    label: const Text("Last Name"),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                  ),
                  validator: (value) {
                    if (lNController.text.isEmpty) {
                      return "Please Enter a Last Name ";
                    }
                  },
                  onSaved: (newValue) => lNController.text = newValue!,
                ),
                const SizedBox(height: 8),

                //Mobile Number
                TextFormField(
                  controller: phoneController,
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: textInputDecoration.copyWith(
                    label: const Text("Mobile Number"),
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Colors.blue,
                    ),
                  ),
                  validator: (value) {
                    if (phoneController.text.isEmpty) {
                      return "Please Enter a Phone Number";
                    }
                  },
                  onSaved: (newValue) => phoneController.text = newValue!,
                ),
                const SizedBox(height: 8),

                //Email
                TextFormField(
                  controller: emailController,
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: textInputDecoration.copyWith(
                    label: const Text("E-mail"),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.blue,
                    ),
                  ),
                  validator: (value) {
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value!)) {
                      return ("Please Enter a valid email");
                    }
                    return null;
                  },
                  onSaved: (newValue) => emailController.text = newValue!,
                ),

                const SizedBox(height: 8),

                //Password
                TextFormField(
                  controller: passwordController,
                  textInputAction: TextInputAction.next,
                  autofocus: false,
                  obscureText: true,
                  decoration: textInputDecoration.copyWith(
                    label: const Text("Password"),
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Colors.blue,
                    ),
                  ),
                  validator: (val) {
                    return RegExp(
                                r"^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$")
                            .hasMatch(val!)
                        ? null
                        : "Please enter at least one alphabet and special character.";
                  },
                  onSaved: (newValue) => passwordController.text = newValue!,
                ),
                const SizedBox(height: 8),

                //Confirm Password
                TextFormField(
                  controller: confirmPasswordController,
                  autofocus: false,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  decoration: textInputDecoration.copyWith(
                    label: const Text("re-Password"),
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Colors.blue,
                    ),
                  ),
                  validator: (value) {
                    if (confirmPasswordController.text !=
                        passwordController.text) {
                      return "Password don't match";
                    }
                    return null;
                  },
                  onSaved: (newValue) =>
                      confirmPasswordController.text = newValue!,
                ),
                const SizedBox(height: 8),

                //Sign Up button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () {
                      signUp(emailController.text, passwordController.text);
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Text.rich(
                  TextSpan(
                      text: "Already have an account?  ",
                      children: [
                        TextSpan(
                            text: "LoginIn",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                              }),
                      ],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    //calling our firestore
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    //calling our userModel
    UserModel userModel = UserModel();

    //Writing all the value
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.phone = phoneController.text;
    userModel.firstName = fNController.text;
    userModel.lastName = lNController.text;

    //sending the data
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account created successfuly :)");
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
