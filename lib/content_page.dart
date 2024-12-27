import 'package:celebrate_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  Map<String, dynamic>? jsonData;
  List images = ['assets/sample.jpg', 'assets/sample.jpg', 'assets/sample.jpg'];
  List<String> titles = ['title1', 'title2', 'title3'];
  List<String> greetings = ['greeting1', 'greeting2', 'greeting3'];
  String titleContent = '';
  String greetingContent = '';

  int currentIndex = 0;

  Future<void> _loadJsonData() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = json.decode(response);
    setState(() {
      jsonData = data;
      greetingContent = jsonData?[greetings[0]] ?? '';
      titleContent = jsonData?[titles[0]] ?? '';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    Widget indicator(int index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        width: currentIndex == index ? 30 : 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? primaryColor : c4Color,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
      );
    }

    Widget header() {
      int index = -1;

      return Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CarouselSlider(
            options: CarouselOptions(
              initialPage: 0,
              viewportFraction: 1.0, // Mengatur lebar slide (95% dari layar)
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                  greetingContent = jsonData?[greetings[index]] ?? '';
                  titleContent = jsonData?[titles[index]] ?? '';
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
          ),
          SizedBox(
            height: defaultMargin,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.map((e) {
                index++;
                return indicator(index);
              }).toList())
        ],
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
            vertical: defaultMargin, horizontal: defaultMargin),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: whiteBone,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: shadowColor, blurRadius: 8, offset: const Offset(2, 8))
            ]),
        child: Scrollbar(
          thumbVisibility: true,
          thickness: 2,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Text(
                  titleContent,
                  style: titleTextStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 26,
                ),
                Text(
                  greetingContent,
                  style: primaryTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        child: Text('this will return as button'),
      );
    }

    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              header(),
              Expanded(
                child: content(),
              ),
              footer()
            ],
          ),
        ),
      ),
    ));
  }
}
