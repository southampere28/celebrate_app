import 'package:celebrate_app/theme.dart';
import 'package:flutter/material.dart';

class SharecontentWidget extends StatelessWidget {
  final String imageLink;
  final String title;
  final String greeting;
  final String senderName;
  final Color backgroundColorTheme;
  final Color cardColor;

  const SharecontentWidget(
      {super.key,
      required this.imageLink,
      required this.title,
      required this.greeting,
      required this.senderName, required this.backgroundColorTheme, required this.cardColor});

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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
          decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: shadowColor,
                    blurRadius: 8,
                    offset: const Offset(2, 8))
              ]),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  imageLink,
                  height: 213,
                  fit: BoxFit.cover,
                ),
              ),
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
                height: 26,
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  greeting,
                  style: primaryTextStyle.copyWith(fontSize: 12),
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
                  const Icon(
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
