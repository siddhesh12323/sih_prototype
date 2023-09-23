import 'package:flutter/material.dart';
import 'package:sih_prototype/screens/sizedbox.dart';

import 'expert_home.dart';
import 'farmer_home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool navigateToFarmerOrExpertHomeScreen = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sign Up', style: Theme.of(context).textTheme.headlineLarge),
              sizedBox(40, 0),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                    hintText: 'Name', border: OutlineInputBorder()),
                keyboardType: TextInputType.name,
              ),
              sizedBox(20, 0),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              sizedBox(20, 0),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                    hintText: 'Password', border: OutlineInputBorder()),
                keyboardType: TextInputType.visiblePassword,
              ),
              sizedBox(20, 0),
              TextField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                    hintText: 'Confirm Password', border: OutlineInputBorder()),
                keyboardType: TextInputType.visiblePassword,
              ),
              sizedBox(20, 0),
              DropdownMenu(
                hintText: 'Select your role',
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: 'Farmer', label: 'Farmer'),
                  DropdownMenuEntry(value: 'Expert', label: 'Expert'),
                ],
                onSelected: (value) {
                  setState(() {
                    value == 'Farmer'
                        ? navigateToFarmerOrExpertHomeScreen = true
                        : navigateToFarmerOrExpertHomeScreen = false;
                  });
                },
                width: MediaQuery.of(context).size.width - 40,
              ),
              sizedBox(40, 0),
              InkWell(
                onTap: () {
                  navigateToFarmerOrExpertHomeScreen
                      ? Navigator.pushNamed(context, '/farmerhome')
                      : Navigator.pushNamed(context, '/experthome');
                },
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Text(
                      'Signup',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
