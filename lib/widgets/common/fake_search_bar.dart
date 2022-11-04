import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/theme/colors.dart';

class FakeSearchBar extends StatelessWidget {
  final String hintText;

  const FakeSearchBar({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.widthConstraints().maxWidth * 0.9,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: const Offset(12, 26),
              blurRadius: 50,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.1)),
        ]),
        child: TextField(
          enabled: false,
          autocorrect: false,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              IconlyLight.search,
              color: PocadotColors.greyscale400,
            ),
            filled: true,
            fillColor: PocadotColors.greyscale100,
            hintText: hintText,
            hintStyle: const TextStyle(color: PocadotColors.greyscale400),
            contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: PocadotColors.greyscale100,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: PocadotColors.greyscale100,
                  width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide:
              BorderSide(color: PocadotColors.primary500, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
        ),
      );
    });
  }
}

