import 'dart:developer';

import 'package:decor_login/screen/sign_in.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String? email;
    String? password;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Account',
          style: TextStyle(color: Color(0xfff4b6a5)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Full Name'),
                    const SizedBox(height: 7),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Your Name',
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text('Email'),
                    const SizedBox(height: 7),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'example@example.com',
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text('Mobile Number'),
                    const SizedBox(height: 7),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: '+123 456 789',
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text('Date Of Birth'),
                    const SizedBox(height: 7),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'DD / MM / YYYY',
                      ),
                    ),
                    const SizedBox(height: 15),
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
                    const SizedBox(height: 15),
                    //---------------------------

                    const Text('Confirm Password'),
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

                    //---------------------------
                  ],
                ),
              ),
            ),
            // const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                // const Spacer(),
                const Text(
                  'By continuing you agree to',
                ),
                const Text(
                  'Terms of Use and Provacy Policy',
                ),
                const SizedBox(height: 5),
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
                    'Sign Up',
                    style: TextStyle(color: Color(0xffcc7861)),
                  ),
                ),
                const SizedBox(height: 15),
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
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.pink,
                      ),
                      child: const Text(
                        'Log in',
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      //Endofpad
    );
  }
}
