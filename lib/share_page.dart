import 'package:flutter/material.dart';

class SharePage extends StatefulWidget {
  final String title;
  final String greeting;
  final String image;

  const SharePage(
      {super.key,
      required this.title,
      required this.greeting,
      required this.image});

  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text('Judul : ${widget.title}'),
          ],
        ),
      ),
    );
  }
}
