import 'dart:io';

import 'package:celebrate_app/theme.dart';
import 'package:flutter/material.dart';

class SharecontentWidget extends StatelessWidget {
  final String imageLink;
  final String title;
  final String greeting;
  final String senderName;
  final Color backgroundColorTheme;
  final Color cardColor;
  final bool isFromSharePage;
  String senderImage;

  SharecontentWidget(
      {super.key,
      required this.imageLink,
      required this.title,
      required this.greeting,
      required this.senderName,
      required this.backgroundColorTheme,
      required this.cardColor,
      this.isFromSharePage = false,
      this.senderImage = ""});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: defaultMargin, horizontal: defaultMargin),
        decoration: BoxDecoration(color: backgroundColorTheme),
        child: Container(
          // widget sharecontent here
          width: double.infinity,
          padding:
              const EdgeInsets.only(left: 10, right: 10, bottom: 24, top: 20),
          decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    color: shadowColor, blurRadius: 8, offset: Offset(2, 8))
              ]),
          child: Column(
            children: [
              LayoutBuilder(builder: (context, constraints) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: isFromSharePage
                      ? Image.file(
                          File(imageLink),
                          width: constraints.maxWidth,
                          height: constraints.maxWidth * (2 / 3),
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          imageLink,
                          width: constraints.maxWidth,
                          height: constraints.maxWidth * (2 / 3),
                          fit: BoxFit.cover,
                        ),
                );
              }),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  title,
                  style: titleTextStyle.copyWith(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  greeting,
                  style: primaryTextStyle.copyWith(fontSize: 12),
                  textAlign: TextAlign.justify,
                ),
              ),
              const Spacer(),
              Text(
                'sender by',
                style:
                    primaryTextStyle.copyWith(fontWeight: bold, fontSize: 12),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  isFromSharePage
                      ? ClipOval(
                          child: Image.file(
                            File(senderImage),
                            height: 17,
                            width: 17,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Icon(
                          Icons.person,
                          size: 17,
                        ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    senderName,
                    style: primaryTextStyle.copyWith(
                        fontWeight: regular, fontSize: 12),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
