import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefrences/login.dart';

class Teacher extends StatefulWidget {
  const Teacher({super.key});

  @override
  State<Teacher> createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  String email = '';
  String password = '';
  String age = '';
  @override
  void initState() {
    // TODO: implement initState

    setState(() {});
    load();
  }

  void load() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString("email") ?? "";
    password = sp.getString("password") ?? "";
    age = sp.getString("age") ?? "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Teacher Page")),
      body: SafeArea(
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: sized_box_for_whitespace
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Text("Email"),
                      const Spacer(),
                      Text(email.toString())
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Text("password"),
                      const Spacer(),
                      Text(password.toString())
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Text("age"),
                      const Spacer(),
                      Text(age.toString())
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    SharedPreferences sp =
                        await SharedPreferences.getInstance();
                    sp.clear();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  LoginPage()));
                  },
                  child: Container(
                    color: Colors.deepOrange,
                    height: 50,
                    width: 300,
                    child: const Center(
                      child: Text(
                        "Logout",
                      ),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
