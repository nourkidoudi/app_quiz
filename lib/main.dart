import 'package:flutter/material.dart';
import 'package:nour/accueil.dart';
import 'homepage.dart';
void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test App',
      //theme: ThemeData(
      //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //useMaterial3: true,),
      // home: homepage(),
      //home: Acceuil(),
      initialRoute: '/accueil',
      routes: {
        '/accueil': (context) =>  const Acceuil(),
        '/homepage': (context) => const MyApp(),

      },
    );
  }
  
}

