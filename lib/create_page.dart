import 'dart:io';

import 'package:celebrate_app/theme.dart';
import 'package:celebrate_app/widget/formfield_desc.dart';
import 'package:celebrate_app/widget/formfield_text.dart';
import 'package:celebrate_app/widget/sharecontent_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart' as p;
import 'package:image_picker/image_picker.dart';

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

  File? _imageFile;
  String? _imagePath;
  File? _imageFileSender;
  String? _senderImagePath;

  @override
  Widget build(BuildContext context) {
    Future<void> pickImage() async {
      try {
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);

        if (image == null) return;

        final imageTemporary = File(image.path);

        setState(() {
          _imageFile = imageTemporary;
          _imagePath = _imageFile!.path;
          Fluttertoast.showToast(msg: 'Success Set Image');
        });
      } on PlatformException catch (e) {
        Fluttertoast.showToast(msg: 'failed pick image $e');
      }
    }

    Future<void> pickImageSender() async {
      try {
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);

        if (image == null) return;

        final imageTemporary = File(image.path);

        setState(() {
          _imageFileSender = imageTemporary;
          _senderImagePath = _imageFileSender!.path;
          Fluttertoast.showToast(msg: 'Success Set Image');
        });
      } on PlatformException catch (e) {
        Fluttertoast.showToast(msg: 'failed pick image $e');
      }
    }

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
                TextButton(
                    style: TextButton.styleFrom(backgroundColor: primaryColor),
                    onPressed: () {
                      pickImage();
                    },
                    child: Text(
                      'Pick Image',
                      style: primaryTextStyle.copyWith(fontSize: 20),
                    )),
                const SizedBox(
                  height: 20,
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
                TextButton(
                    style: TextButton.styleFrom(backgroundColor: primaryColor),
                    onPressed: () {
                      pickImageSender();
                    },
                    child: Text(
                      'Pick Image',
                      style: primaryTextStyle.copyWith(fontSize: 20),
                    )),
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
                              imageLink: _imagePath!,
                              title: titleController.text,
                              greeting: greetingController.text,
                              senderName: senderController.text,
                              backgroundColorTheme: backgroundColorTheme,
                              cardColor: cardColor,
                              isFromSharePage: true,
                              senderImage: _senderImagePath!,
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
