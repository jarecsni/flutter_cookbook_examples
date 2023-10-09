import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextLayout extends StatelessWidget {
  const TextLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello world",
          style: GoogleFonts.leckerliOne(fontSize: 40),
        ),
        Text(
          "Text can wrap without any issues so you can see this is an example",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const Text(
          "Lorem ipsum dolor sit amet, consectetur adipisci elit. Etiam at mauris massa. Suspendisse potenti. Aenean aliqeut eu nisi vitae tempus.",
        ),
        const Divider(),
        RichText(
          text: const TextSpan(
            text: "Flutter text is ",
            style: TextStyle(fontSize: 22, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                  text: "really ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                  children: [
                    TextSpan(
                        text: "powerful",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.double,
                          fontSize: 40,
                        )),
                  ]),
            ],
          ),
        )
      ],
    );
  }
}
