import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/screens/login_screen.dart';
import 'package:lista_de_tarefas/controllers/login_controller.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Provider<LoginController>(
      create: (_) => LoginController(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 54, 85, 185),
        textSelectionTheme: const TextSelectionThemeData( cursorColor: Colors.white),
        scaffoldBackgroundColor: const Color.fromARGB(255, 250, 162, 233)
      ),
      home: const LoginScreen(),
    ),
    );
  }


}