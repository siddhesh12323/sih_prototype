import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sih_prototype/screens/sizedbox.dart';
import 'package:sih_prototype/screens/signup_screen.dart';

import '../presentation/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  final _auth = FirebaseAuth.instance;
  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: _emailController.text.toString(),
            password: _passwordController.text.toString())
        .then((value) {
      Utils().toastMessage("${value.user!.email.toString()} logged in!");
      !farmerOrExpert
          ? Navigator.pushNamed(context, '/experthome')
          : Navigator.pushNamed(context, '/farmerhome');
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool farmerOrExpert = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Login',
                        style: Theme.of(context).textTheme.headlineLarge),
                    sizedBox(40, 0),
                    Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                                  border: OutlineInputBorder()),
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
                              obscureText: true,
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                hintText: 'Password',
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                            ),
                          ],
                        )),
                    sizedBox(40, 0),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          login();
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
                                  'Login',
                                  style: TextStyle(color: Colors.white),
                                ),
                        ),
                      ),
                    ),
                    sizedBox(40, 0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?'),
                        sizedBox(0, 4),
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(color: Colors.blue),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
