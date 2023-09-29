import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfoo/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PortFolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          hintColor: Colors.deepPurpleAccent,
          textTheme: GoogleFonts.poppinsTextTheme(),
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const HomeScreen(),
    );
  }
}
