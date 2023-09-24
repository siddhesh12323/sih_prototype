import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sih_prototype/presentation/utils.dart';
import 'package:sih_prototype/screens/sizedbox.dart';

import 'expert_home.dart';
import 'farmer_home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
            email: _emailController.text.toString(),
            password: _passwordController.text.toString())
        .then((value) {
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  bool loading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
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
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name!';
                          }
                          return null;
                        },
                        controller: _nameController,
                        decoration: const InputDecoration(
                            hintText: 'Name', border: OutlineInputBorder()),
                        keyboardType: TextInputType.name,
                      ),
                      sizedBox(20, 0),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email!';
                          }
                          return null;
                        },
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      sizedBox(20, 0),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password!';
                          }
                          return null;
                        },
                        controller: _passwordController,
                        decoration: const InputDecoration(
                            hintText: 'Password', border: OutlineInputBorder()),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      sizedBox(20, 0),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please confirm your password!';
                          }
                          return null;
                        },
                        controller: _confirmPasswordController,
                        decoration: const InputDecoration(
                            hintText: 'Confirm Password',
                            border: OutlineInputBorder()),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ],
                  )),
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
                  if (_formKey.currentState!.validate()) {
                    login();
                    navigateToFarmerOrExpertHomeScreen
                        ? Navigator.pushNamed(context, '/farmerhome')
                        : Navigator.pushNamed(context, '/experthome');
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: loading
                        ? const CircularProgressIndicator(
                            strokeWidth: 3,
                            color: Colors.white,
                          )
                        : const Text(
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
