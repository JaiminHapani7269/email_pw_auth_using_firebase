import 'package:auth_demo/screen/auth/registration_screen.dart';
import 'package:auth_demo/screen/home_screem.dart';
import 'package:auth_demo/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  "Login here..",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset("assets/login.jpg"),
                const SizedBox(height: 20),

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
                  textInputAction: TextInputAction.done,
                  autofocus: false,
                  obscureText: true,
                  decoration: textInputDecoration.copyWith(
                    label: const Text("Password"),
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Colors.blue,
                    ),
                  ),
                  validator: (value) {
                    if (passwordController.text.isEmpty) {
                      return "Please enter your password";
                    }
                  },
                  onSaved: (newValue) => passwordController.text = newValue!,
                ),
                const SizedBox(height: 8),

                //loginin button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () {
                      signIn(emailController.text, passwordController.text);
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Text.rich(
                  TextSpan(
                      text: "Don't have an account?  ",
                      children: [
                        TextSpan(
                            text: "Create Account",
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
                                            const RegistrationScreen()));
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

  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen())),
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
}
