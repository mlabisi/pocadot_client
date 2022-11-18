import 'package:flutter/material.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:pocadot_client/widgets/cards/square_card.dart';

class ListingCard extends StatelessWidget {
  final String featuredImage;
  final String avatarImage;
  final String listingTag;
  final String username;
  final String artist;
  final String release;
  final Function() onPressed;

  const ListingCard(
      {required this.onPressed,
      required this.featuredImage,
      required this.listingTag,
      required this.username,
      required this.artist,
      required this.release,
      required this.avatarImage,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SquareCard(content: [
        Container(
          width: constraints.widthConstraints().maxWidth * 0.8,
          height: constraints.widthConstraints().maxWidth * 0.8,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            featuredImage,
            fit: BoxFit.fitWidth,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                Text(
                  artist,
                  style: const TextStyle(
                    color: PocadotColors.greyscale900,
                    fontFamily: 'Jua',
                  ),
                ),
                Text(
                  release,
                  style: const TextStyle(
                    color: PocadotColors.greyscale700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 8,
                  backgroundImage: AssetImage(
                    avatarImage,
                  ),
                ),
                const SizedBox(width: 2,),
                Expanded(
                  child: Text(
                    '@$username',
                    style: const TextStyle(
                      color: PocadotColors.greyscale900,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Chip(
                  backgroundColor: PocadotColors.transparentBlue,
                  labelPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  label: Text(
                    listingTag,
                    style: const TextStyle(
                      color: PocadotColors.primary500,
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ], onPressed: onPressed);
    });
  }
}
