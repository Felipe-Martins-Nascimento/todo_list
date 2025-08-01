import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'src/home_page.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.amber,
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 18, 18),
        textTheme: const TextTheme(bodyLarge: TextStyle(fontSize: 16)),
      ),
      home: HomePage(),
    );
  }
}
