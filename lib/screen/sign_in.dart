import 'dart:developer';

import 'package:decor_login/screen/sign_up.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String? email;
    String? password;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
            ),
            const SizedBox(height: 2),
            const Text('Please enter your details to proceed.'),
            const SizedBox(height: 50),
            Expanded(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Username Or Email'),
                    const SizedBox(height: 7),
                    TextFormField(
                      decoration: const InputDecoration(
                        // isDense: true,
                        hintText: 'example@example.com',
                        // hintStyle: TextStyle(
                        //   color: Color.fromARGB(158, 235, 220, 205),
                        // ),
                        // filled: true,
                        // fillColor: Color(0xfffaf0e6),
                        // border: OutlineInputBorder(
                        //   borderSide: BorderSide.none,
                        //   borderRadius: BorderRadius.all(
                        //     Radius.circular(20),
                        //   ),
                        // ),
                      ),
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty == true) {
                          return 'email is missed';
                        }

                        if (!(value.contains('@'))) {
                          return 'email is invalid';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        email = newValue;
                      },
                    ),
                    const SizedBox(height: 30),
                    const Text('Password'),
                    const SizedBox(height: 7),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Please enter your password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty == true) {
                          return 'password is missed';
                        }
                        if (value.length <= 7) {
                          return 'password must be atleast 8 chars';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        password = value;
                      },
                    ),
                    const SizedBox(height: 40),
                    // const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfff4b5a4),
                      ),
                      onPressed: () {
                        if (formKey.currentState?.validate() == true) {
                          formKey.currentState!.save();
                          formKey.currentState?.reset();
                          log(email.toString());
                          log(password.toString());
                        }
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(color: Color(0xffcc7861)),
                      ),
                    ),
                    const SizedBox(height: 7),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Forgot Password?'),
                    ),
                  ],
                ),
              ),
            ),
            // const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('or sign up with'),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        child: Image.asset('assets/images/fb_icon.png'),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ClipRRect(
                        child: Image.asset('assets/images/google_icon.png'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,                    
                    children: [
                      const Text('Don\'t have an account?'),
                      const SizedBox(
                        width: 4,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUp(),
                          ),
                        );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.pink,
                        ),
                        child: const Text(
                          'Sign Up',
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
