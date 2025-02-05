import 'dart:developer';
import 'package:celebrate_app/create_page.dart';
import 'package:celebrate_app/provider/response_provider.dart';
import 'package:celebrate_app/theme.dart';
import 'package:celebrate_app/widget/button_primary.dart';
import 'package:celebrate_app/widget/formfield_desc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({super.key});

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  final descController = TextEditingController();

  Future<void> sendtoWhatsApp(String phoneNumber, String text) async {
    Uri url = Uri.parse('https://wa.me/$phoneNumber?text=$text');
    await launchUrl(url);
  }

  Future<void> sendToWhatsApp2(String text) async {
    Uri url = Uri.parse('https://wa.me/?text=$text');
    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    ResponseProvider responseProvider = Provider.of<ResponseProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/thank_image.jpg',
              width: 190,
            ),
            const SizedBox(
              height: 8,
            ),
            FormFieldDeskripsi(
                labelField: "Sampaikan Balasan",
                hinTxt: "Tulis Pesan Kamu Disini",
                controller: descController),
            const SizedBox(
              height: 14,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ButtonPrimary(
                ontap: () async {
                  // logic generate here
                  Fluttertoast.showToast(msg: 'Generate Message');
                  await responseProvider.generateResponse();
                  log(responseProvider.response);
                  descController.text = responseProvider.response;
                },
                title: "Generate With AI",
                bgcolor: primaryColor,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ingin membuat kartu ucapan sendiri? ',
                  style: blackTextStyle.copyWith(fontSize: 12),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreatePage()));
                  },
                  child: Text(
                    'Klik di sini',
                    style: hyperlinkTextStyle.copyWith(fontSize: 12),
                  ),
                )
              ],
            ),
            const Spacer(),
            SizedBox(
                width: double.infinity,
                child: ButtonPrimary(
                  ontap: () {
                    if (descController.text != '') {
                      sendToWhatsApp2(descController.text);
                    } else {
                      Fluttertoast.showToast(msg: 'Anda belum mengisi pesan!');
                    }
                  },
                  title: "Kirim Pesan",
                  bgcolor: primaryColor,
                )),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      )),
    );
  }
}
