import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagramclone/services/util.dart';

import 'home_page.dart';
import 'sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController? _emailController;
  TextEditingController? _passController;

  bool isVisible = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passController = TextEditingController();
  }

  bool emailValidator(String email) {
    String p =
        r'^[^<>()[\]\\,;:\%#^\s@\"$&!@]+@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z0-9]+\.)+[a-zA-Z]{2,}))$';

    return RegExp(p).hasMatch(email);
  }

  bool passwordValidator(String password) {
    String p = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    return RegExp(p).hasMatch(password);
  }

  _signIn() {
    String email = _emailController!.text.trim();
    String pass = _passController!.text.trim();

    if (email.isEmpty || pass.isEmpty) {
      Util.ToastMS("Enter completely!");
      return;
    }

    if (formKey.currentState!.validate()) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xffffcaf45), Color(0xffff56040)]),
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Instagram",
                        style: TextStyle(
                            fontSize: 46,
                            color: Colors.white,
                            fontFamily: "Billabong"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          validator: (value) => emailValidator(value!)
                              ? null
                              : "Please enter a valid email",
                          controller: _emailController,
                          style: TextStyle(color: Colors.grey.shade300),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.3),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            hintStyle: TextStyle(color: Colors.grey.shade300),
                            hintText: "Email",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          validator: (value) => passwordValidator(value!)
                              ? null
                              : "Please enter a valid password",
                          controller: _passController,
                          obscureText: isVisible,
                          style: TextStyle(color: Colors.grey.shade300),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.3),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                padding: const EdgeInsets.all(0),
                                icon: Icon(
                                  isVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey.shade300,
                                )),
                            hintStyle: TextStyle(color: Colors.grey.shade300),
                            hintText: "Password",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        child: OutlinedButton(
                            style: ButtonStyle(
                                side: MaterialStatePropertyAll(BorderSide(
                                    color: Colors.grey.shade400
                                        .withOpacity(0.6)))),
                            onPressed: () {
                              _signIn();
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don`t have an account?",
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
