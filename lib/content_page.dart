import 'package:celebrate_app/provider/content_provider.dart';
import 'package:celebrate_app/share_page.dart';
import 'package:celebrate_app/theme.dart';
import 'package:celebrate_app/widget/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    ContentProvider contentProvider = Provider.of<ContentProvider>(context);

    Widget indicator(int index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        width: contentProvider.currentIndex == index ? 30 : 10,
        height: 10,
        decoration: BoxDecoration(
            color:
                contentProvider.currentIndex == index ? primaryColor : c4Color,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
      );
    }

    Widget header() {
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
                contentProvider.updateContent(index);
              },
            ),
            items: contentProvider.images
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
              children: contentProvider.images
                  .asMap()
                  .entries
                  .map((entry) => indicator(entry.key))
                  .toList()),
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
                  contentProvider.titleContent,
                  style: titleTextStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 26,
                ),
                Text(
                  contentProvider.greetingContent,
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
        margin: EdgeInsets.only(
          bottom: 50,
          top: defaultMargin,
          right: defaultMargin,
          left: defaultMargin,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.face_3_rounded,
              color: primaryColor,
              size: 40,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(child: ButtonPrimary(
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SharePage(
                            title: contentProvider.titleContent,
                            greeting: contentProvider.greetingContent,
                            image: contentProvider
                                .images[contentProvider.currentIndex])));
              },
            )),
            SizedBox(
              width: 12,
            ),
            Icon(
              Icons.share,
              color: primaryColor,
              size: 40,
            )
          ],
        ),
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
