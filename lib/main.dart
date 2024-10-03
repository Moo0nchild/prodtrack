import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:prodtrack/pages/index_pages.dart';
import 'package:prodtrack/pages/login_page.dart';

import 'firebase_options.dart';

void main() async {
  // Asegúrate de que los widgets se han inicializado antes de llamar a Firebase.
  WidgetsFlutterBinding.ensureInitialized();

  // Espera a que Firebase se inicialice antes de continuar.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Ahora que Firebase está inicializado, puedes ejecutar la aplicación.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Mi aplicación",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // La página principal de tu aplicación.
    );
  }
}
