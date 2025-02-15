import 'package:celebrate_app/content_page.dart';
import 'package:celebrate_app/create_page.dart';
import 'package:celebrate_app/feedback_page.dart';
import 'package:celebrate_app/provider/content_provider.dart';
import 'package:celebrate_app/provider/response_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ContentProvider()..loadJsonData(),
        ),
        ChangeNotifierProvider(create: (context) => ResponseProvider()),
      ],
      child: MaterialApp(
          title: 'Celebrate App',
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => const ContentPage(),
            '/content': (context) => const ContentPage(),
            '/feedback-page': (context) => const FeedBackPage(),
            '/create-page': (context) => const CreatePage(),
          },
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),),
    );
  }
}
