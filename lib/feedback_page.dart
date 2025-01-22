import 'package:celebrate_app/theme.dart';
import 'package:celebrate_app/widget/button_primary.dart';
import 'package:celebrate_app/widget/formfield_desc.dart';
import 'package:flutter/material.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({super.key});

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                ontap: () {},
                title: "Generate With AI",
                bgcolor: primaryColor,
              ),
            ),
            const Spacer(),
            SizedBox(
                width: double.infinity,
                child: ButtonPrimary(
                  ontap: () {},
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
