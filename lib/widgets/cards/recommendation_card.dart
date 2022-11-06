import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:pocadot_client/widgets/cards/square_card.dart';
import 'package:pocadot_client/widgets/cards/swiper.dart';

class RecommendationCard extends StatelessWidget {
  final String imagePath;
  final String artist;
  final String listingTag;
  final String release;
  final Function() onTapped;
  final SwiperController controller;

  const RecommendationCard(
      {required this.imagePath,
      required this.artist,
      required this.release,
      required this.listingTag,
      required this.onTapped,
      required this.controller,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SquareCard(content: [
        Container(
          width: constraints.widthConstraints().maxWidth * 0.75,
          height: constraints.widthConstraints().maxWidth * 0.75,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            imagePath,
            fit: BoxFit.fitWidth,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          artist,
          style: const TextStyle(
            color: PocadotColors.greyscale900,
            fontFamily: 'Jua',
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          release,
          style: const TextStyle(
            color: PocadotColors.greyscale700,
            fontSize: 12,
            fontFamily: "Urbanist",
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Chip(
          backgroundColor: PocadotColors.transparentBlue,
          label: Text(
            listingTag,
            style: const TextStyle(
              color: PocadotColors.primary500,
              fontSize: 8,
              fontFamily: "Urbanist",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
            width: constraints.widthConstraints().maxWidth * 0.75,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(12),
                      backgroundColor: PocadotColors.alertsStatusError,
                      foregroundColor: PocadotColors.othersWhite),
                  onPressed: () {
                    controller.swipeLeft();
                  },
                  child: const Icon(Icons.close,
                      size: 10, color: PocadotColors.othersWhite),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(12),
                      backgroundColor: PocadotColors.primary500,
                      foregroundColor: PocadotColors.othersWhite),
                  onPressed: () {
                    controller.swipeRight();
                  },
                  child: const Icon(
                    IconlyBold.heart,
                    size: 10,
                    color: PocadotColors.othersWhite,
                  ),
                ),
              ],
            )),
      ], onPressed: onTapped);
    });
  }
}
