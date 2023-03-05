import 'package:flutter/material.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/main.dart';

class RegisterUserView extends StatelessWidget {
  const RegisterUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: const Text('Sign Up Form'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: const [
                  Text(
                    'Registration',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: const [
                  Text(
                    'Enter your details to create a login',
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),

              //! Text Fields
              TextField(
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                //keyboardType: TextInputType.number,
                //inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                //keyboardType: TextInputType.number,
                //inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'E-Mail',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                //keyboardType: TextInputType.number,
                //inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'User Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                //keyboardType: TextInputType.number,
                //inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                //keyboardType: TextInputType.number,
                //inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
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
                        return const LoginPage();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
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
