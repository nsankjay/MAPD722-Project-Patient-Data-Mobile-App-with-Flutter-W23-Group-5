import 'package:flutter/material.dart';

class ListCriticalPatientsView extends StatelessWidget {
  const ListCriticalPatientsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: const Text ('Critical Patients List'),
        centerTitle: true,
      ),
    );
  }
}