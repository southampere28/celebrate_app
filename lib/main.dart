import 'package:celebrate_app/cobacoba/page_listview.dart';
import 'package:celebrate_app/cobacoba/page_scaffold.dart';
import 'package:celebrate_app/content_page.dart';
import 'package:celebrate_app/provider/content_provider.dart';
import 'package:celebrate_app/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp(
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ContentProvider()..loadJsonData()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: true,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: ContentPage()),
    );
  }
}
