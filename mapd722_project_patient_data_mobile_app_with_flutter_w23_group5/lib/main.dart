//  File Name - mapd722_project_patient_data_mobile_app_with_flutter_w23_group5
//  Course - MAPD722
//  Course Instructer - Rania Arbash
//  Project Authors - Sankjay Nithyanandalingam (301296000), Victor Quezada (301286477)
//  Created on - 27/02/2023
//  Modified Last - 17/03/2023
//  Description - Patient Data Mobile App is a app developped using Flutter and its purpose is to help health care
//                professionals to maintain records of Patients and their Clinical Data. And also to Identify their health
//                condition at any given time.
//  Version v1.1 - 05/03/2023
//  Version v1.2 - 17/03/2023
//  Version v1.3 - 02/04/2023
//

// ignore_for_file: sized_box_for_whitespace

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/list_patients_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/patient_details_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/register_user_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/test_home_page.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/test_list1.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/test_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeCare App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

final TextEditingController userNameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passenable = true; //boolean value to track password view enable disable.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: const Text('Welcome'),
      //   centerTitle: true,
      // ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  color: Color.fromARGB(255, 233, 148, 139),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'WeCare Healthcare',
                style: TextStyle(
                  color: Color.fromARGB(255, 85, 202, 241),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              // Image.network(
              //     'https://png.pngtree.com/template/20190926/ourmid/pngtree-medical-pharmacy-heart-healthcare-logo-vector-graphic-design-image_309769.jpg'),
              Image.asset(
                'images/healthcarelogo.webp',
                // height: 250,
                // width: 250,
              ),
              Row(
                children: const [
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: 60,
                child: TextField(
                  key: const Key("userNameField"),
                  controller: userNameController,
                  decoration: InputDecoration(
                    labelText: 'User Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  //keyboardType: TextInputType.number,
                  //inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                child: TextField(
                  key: const Key("passwordField"),
                  controller: passwordController,
                  obscureText:
                      passenable, //if passenable == true, show **, else show password character
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffix: IconButton(
                      onPressed: () {
                        //add Icon button at end of TextField
                        setState(() {
                          //refresh UI
                          if (passenable) {
                            //if passenable == true, make it false
                            passenable = false;
                          } else {
                            passenable =
                                true; //if passenable == false, make it true
                          }
                        });
                      },
                      icon: Icon(passenable == true
                          ? Icons.remove_red_eye
                          : Icons.password),
                    ),
                    //eye icon if passenable = true, else, Icon is ***__
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  //keyboardType: TextInputType.number,
                  //inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //! Login Button
              ElevatedButton(
                onPressed: () async {
                  //   Navigator.of(context).pushReplacement(
                  //     MaterialPageRoute(
                  //       builder: (BuildContext context) {
                  //         return const testList1();
                  //       },
                  //     ),
                  //   );
                  int responseCode = await loginAPI();
                  if (responseCode == 200) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const testList1();
                        },
                      ),
                    );
                    userNameController.clear();
                    passwordController.clear();
                  } else {
                    _showMyDialog(context);
                  }
                },
                key: const Key("loginBtn"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(420, 50),
                  shape: const StadiumBorder(),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              //! Register Button
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const RegisterUserView();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 233, 148, 139),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(420, 50),
                  shape: const StadiumBorder(),
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<int> loginAPI() async {
  var requestBody = json.encode({
    "username": userNameController.text,
    "password": passwordController.text,
  });
  print(requestBody);
  final response = await http.post(Uri.parse(baseUrl! + "api/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
      },
      body: requestBody);
  print(response.body);
  return response.statusCode;
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Login Error'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              //Text('Login Error'),
              Text('User Name or Password Mismatch'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
