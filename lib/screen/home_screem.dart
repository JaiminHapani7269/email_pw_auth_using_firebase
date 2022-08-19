import 'package:auth_demo/model/user_model.dart';
import 'package:auth_demo/screen/auth/login_screen.dart';
import 'package:auth_demo/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome to our community....",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Image.asset(
                "assets/avatar.jpg",
                height: 200,
              ),
              const SizedBox(height: 20),
              Text(
                "${loggedInUser.firstName} ${loggedInUser.lastName}",
                style: HomeScreenTextStyle.copyWith(color: Colors.blue),
              ),
              const SizedBox(height: 15),
              Text(
                "${loggedInUser.phone}",
                style: HomeScreenTextStyle.copyWith(fontSize: 22),
              ),
              Text(
                "${loggedInUser.email}",
                style: HomeScreenTextStyle.copyWith(fontSize: 22),
              ),
              const SizedBox(height: 15),
              ActionChip(
                  backgroundColor: Colors.red.withOpacity(0.3),
                  label: const Text("Logout"),
                  onPressed: () {
                    logout(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
