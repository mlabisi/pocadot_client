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
          width: constraints.widthConstraints().maxWidth * 0.5,
          height: constraints.widthConstraints().maxWidth * 0.5,
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
        SizedBox(
          width: constraints.widthConstraints().maxWidth * 0.5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    artist,
                    style: const TextStyle(
                      color: PocadotColors.greyscale900,
                      fontFamily: 'Jua',
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    release,
                    style: const TextStyle(
                      color: PocadotColors.greyscale700,
                      fontSize: 12,
                      fontFamily: "Urbanist",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
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
                  const SizedBox(width: 5,),
                  Expanded(
                    child: Text(
                      '@$username',
                      style: const TextStyle(
                        color: PocadotColors.greyscale900,
                        fontSize: 12,
                        fontFamily: "Urbanist",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Chip(
                    backgroundColor: PocadotColors.primary500,
                    label: Text(
                      listingTag,
                      style: const TextStyle(
                        color: PocadotColors.othersWhite,
                        fontSize: 8,
                        fontFamily: "Urbanist",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ], onPressed: onPressed);
    });
  }
}
