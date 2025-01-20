import 'package:celebrate_app/provider/content_provider.dart';
import 'package:celebrate_app/theme.dart';
import 'package:celebrate_app/widget/button_primary.dart';
import 'package:celebrate_app/widget/sharecontent_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

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
  ScreenshotController screenshotController = ScreenshotController();

  Color backgroundColorTheme = Colors.white;
  Color cardColor = whiteBone;

  // backgroundColorTheme
  final List<Color> backgroundColors = [
    Colors.white,
    Colors.grey.shade200,
    Colors.blue.shade50,
    Colors.green.shade50,
    Colors.pink.shade50,
  ];

  // cardColorTheme
  final List<Color> cardColors = [
    whiteBone,
    Colors.grey.shade100,
    Colors.blue.shade100,
    Colors.green.shade100,
    Colors.pink.shade100,
  ];

  // indexThemeList
  int currentIndex = 0;

  // functionChangeTheme
  void changeTheme() {
    setState(() {
      // Ganti warna ke index berikutnya
      currentIndex = (currentIndex + 1) % backgroundColors.length;
      backgroundColorTheme = backgroundColors[currentIndex];
      cardColor = cardColors[currentIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    ContentProvider contentProvider = Provider.of<ContentProvider>(context);

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
            vertical: defaultMargin, horizontal: defaultMargin),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
        decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: shadowColor, blurRadius: 8, offset: const Offset(2, 8))
            ]),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                widget.image,
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
                widget.title,
                style: titleTextStyle.copyWith(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                widget.greeting,
                style: primaryTextStyle.copyWith(fontSize: 12),
              ),
            ),
            const Spacer(),
            Text(
              'sender by',
              style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 12),
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
                  contentProvider.senderName,
                  style: primaryTextStyle.copyWith(
                      fontWeight: regular, fontSize: 12),
                ),
              ],
            )
          ],
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
            const SizedBox(
              width: 12,
            ),
            Expanded(
                child: ButtonPrimary(
              ontap: () async {
                final image = await screenshotController.captureFromWidget(
                  SharecontentWidget(
                    imageLink: widget.image,
                    title: widget.title,
                    greeting: widget.greeting,
                    senderName: contentProvider.senderName,
                    backgroundColorTheme: backgroundColorTheme,
                    cardColor: cardColor,
                  ),
                );
                Share.shareXFiles([XFile.fromData(image, mimeType: "png")]);
              },
              title: 'Share',
            )),
            const SizedBox(
              width: 12,
            ),
            GestureDetector(
              onTap: () {
                // logic changing color theme here
                changeTheme();
                Fluttertoast.showToast(msg: 'Tema telah diubah!');
              },
              child: ClipOval(
                child: Image.asset(
                  'assets/rainbow.jpg',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColorTheme,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [Expanded(child: content()), footer()],
          ),
        ),
      ),
    );
  }
}
