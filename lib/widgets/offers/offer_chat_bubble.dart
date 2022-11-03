import 'package:flutter/material.dart';
import 'package:pocadot_client/theme/colors.dart';

class OfferChatBubble extends StatelessWidget {
  final String label;
  final String message;
  final String? offerPrice;
  final String? offeredListing;
  final bool priceNegotiated;
  final bool listingNegotiated;

  const OfferChatBubble(
      {super.key,
      required this.label,
      required this.message,
      this.offerPrice,
      this.offeredListing,
      this.priceNegotiated = false,
      this.listingNegotiated = false});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.widthConstraints().maxWidth * 0.75,
        height: constraints.widthConstraints().maxWidth * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: PocadotColors.primary500,
            width: 1,
          ),
          boxShadow: const [
            BoxShadow(
              color: PocadotColors.greyscale200,
              blurRadius: 60,
              offset: Offset(0, 4),
            ),
          ],
          color: PocadotColors.backgroundBlue,
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                  color: PocadotColors.greyscale900,
                  fontSize: 18,
                  fontFamily: 'Jua'),
            ),
            const SizedBox(height: 10),
            Text(
              '"$message"',
              style: const TextStyle(
                color: PocadotColors.greyscale800,
                fontSize: 14,
                fontFamily: "Urbanist",
                fontWeight: FontWeight.w500,
              ),
            ),
            const Expanded(child: Spacer()),
            const Divider(
                thickness: 1,
                indent: 0,
                endIndent: 0,
                color: PocadotColors.primary500),
            const Expanded(child: Spacer()),
            Wrap(spacing: 10, direction: Axis.horizontal, children: [
              if (offerPrice?.isNotEmpty ?? false)
                Container(
                  width: 60,
                  height: 60,
                  child: Stack(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: PocadotColors.primary500,
                            width: 1,
                          ),
                          color: PocadotColors.othersWhite,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            offerPrice!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: PocadotColors.greyscale900,
                            ),
                          ),
                        ),
                      ),
                      if (priceNegotiated)
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: PocadotColors.othersRed,
                              width: 1,
                            ),
                            color: PocadotColors.transparentRed,
                          ),
                        )
                      else
                        Container()
                    ],
                  ),
                )
              else
                Container(),

              if (offeredListing?.isNotEmpty ?? false)
                Container(
                  width: 60,
                  height: 60,
                  child: Stack(
                    // alignment: Alignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: PocadotColors.primary500,
                            width: 1,
                          ),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          offeredListing!,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      if (listingNegotiated)
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: PocadotColors.othersRed,
                              width: 1,
                            ),
                            color: PocadotColors.transparentRed,
                          ),
                        )
                      else
                        Container(),
                    ],
                  ),
                )
              else
                Container(),
            ])
          ],
        ),
      );
    });
  }
}
