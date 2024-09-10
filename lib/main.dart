import 'package:flutter/material.dart';

import 'package:decor_login/screen/sign_in.dart';
import 'package:decor_login/screen/sign_up.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),

        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0)),
        useMaterial3: true,
        // inputDecorationTheme: InputDecorationTheme(
        //   border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        // ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            color: Color.fromARGB(158, 235, 220, 205),
          ),
          isDense: true,
          filled: true,
          fillColor: Color(0xfffaf0e6),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
      home: const SignInScreen(),
    ),
  );
}
