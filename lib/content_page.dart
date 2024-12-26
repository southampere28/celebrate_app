import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  List images = ['assets/sample.jpg', 'assets/sample.jpg', 'assets/sample.jpg'];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return CarouselSlider(
        options: CarouselOptions(
          initialPage: 0,
          viewportFraction: 1.0, // Mengatur lebar slide (95% dari layar)
          onPageChanged: (index, reason) {
            setState(() {
              currentIndex = index;
              print('page number $currentIndex');
            });
          },
        ),
        items: images
            .map((image) => Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(
                      horizontal:
                          MediaQuery.of(context).size.width * 0.05), // Gap
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      image,
                      height: 233,
                      fit: BoxFit.cover,
                    ),
                  ),
                ))
            .toList(),
      );
    }

    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            header()
          ],
        ),
      ),
    ));
  }
}
