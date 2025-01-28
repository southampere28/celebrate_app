import 'package:celebrate_app/theme.dart';
import 'package:celebrate_app/widget/formfield_desc.dart';
import 'package:celebrate_app/widget/formfield_text.dart';
import 'package:celebrate_app/widget/sharecontent_widget.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  ScreenshotController screenshotController = ScreenshotController();

  final titleController = TextEditingController();
  final greetingController = TextEditingController();
  final senderController = TextEditingController();

  Color backgroundColorTheme = Colors.white;
  Color cardColor = whiteBone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Tambah Data',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                FormfieldText(
                    controller: titleController,
                    icon: null,
                    keyType: TextInputType.text,
                    labelField: 'Judul Ucapan',
                    hintTxt: "(Judul)"),
                const SizedBox(
                  height: 20,
                ),
                FormFieldDeskripsi(
                    labelField: "Pesan / Ucapan",
                    hinTxt: "(tuliskan pesan/ucapan disini)",
                    controller: greetingController),
                const SizedBox(
                  height: 20,
                ),
                FormfieldText(
                    controller: senderController,
                    icon: null,
                    keyType: TextInputType.text,
                    labelField: 'Pengirim',
                    hintTxt: "(tuliskan nama kamu / nama samaran disini)"),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        onPressed: () async {
                          final image =
                              await screenshotController.captureFromWidget(
                            SharecontentWidget(
                              imageLink: "assets/sample.jpg",
                              title: titleController.text,
                              greeting: greetingController.text,
                              senderName: senderController.text,
                              backgroundColorTheme: backgroundColorTheme,
                              cardColor: cardColor,
                            ),
                          );
                          Share.shareXFiles(
                              [XFile.fromData(image, mimeType: "png")]);
                        },
                        child: Text(
                          'Share',
                          style: whiteTextStyle.copyWith(fontSize: 16),
                        )))
              ],
            ),
          ),
        ));
  }
}
