import 'package:flutter/material.dart';
import 'package:uas_kelompok3/register.dart';
import 'function/func_login.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';
// ignore: unused_import
import 'package:uas_kelompok3/register.dart';
import 'package:uas_kelompok3/function/func_register.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController ctl_nm = TextEditingController();
  TextEditingController ctl_user = TextEditingController();
  TextEditingController ctl_pwd = TextEditingController();

  showToast() {
    setState(() {
      Fluttertoast.showToast(
          msg: 'Kamu lupa passwordnya apa?',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: Image.asset(
                  'images/LogoSTTB.png',
                  width: 200,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: ctl_nm,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Input Username Anda',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: ctl_user,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Input Username Anda',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: ctl_pwd,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Input Password Anda',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      addData(
                          context, ctl_user.text, ctl_pwd.text, ctl_nm.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(40, 167, 69, 1),
                    ),
                    child: const Text("Register",
                        style:
                            TextStyle(fontSize: 25.0, fontFamily: 'Righteous')),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // ]
      // ),
    );
  }
}
