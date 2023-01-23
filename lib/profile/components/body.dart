import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uas_kelompok3/menu/about_menu.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    void showToast_notification() {
      setState(() {
        Fluttertoast.showToast(
            msg: 'Ini adalah halaman notifikasi',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.green);
      });
    }

    void showToast_setting() {
      setState(() {
        Fluttertoast.showToast(
            msg: 'Ini adalah halaman setting',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.green);
      });
    }

    void showToast_help_center() {
      setState(() {
        Fluttertoast.showToast(
            msg: 'Ini adalah halaman Help Center',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.green);
      });
    }

    void logout() {
      Widget buttonCancel = MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Tidak'));
      Widget buttonOK = MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: const Text('Ok'));

      AlertDialog logout = AlertDialog(
        title: Text("Logout"),
        content: Text("Apakah Kamu yakin ingin keluar dari aplikasi?"),
        actions: [buttonCancel, buttonOK],
      );

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return logout;
          });
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomRight: Radius.circular(40.0),
                    bottomLeft: Radius.circular(40.0)),
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage("images/bg_abstrak.png"),
                  fit: BoxFit.cover,
                )),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/bg_profil.png"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: ProfilePic(),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          ProfileMenu(
              text: "About Me",
              icon: "images/User Icon.svg",
              press: () => Navigator.pushNamed(context, '/about')),
          ProfileMenu(
            text: "Notifications",
            icon: "images/Bell.svg",
            press: () => showToast_notification(),
          ),
          ProfileMenu(
            text: "Settings",
            icon: "images/Settings.svg",
            press: () => showToast_setting(),
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "images/Question mark.svg",
            press: () => showToast_help_center(),
          ),
          ProfileMenu(
              text: "Log Out",
              icon: "images/Log out.svg",
              press: () => logout()),
        ],
      ),
    );
  }
}
