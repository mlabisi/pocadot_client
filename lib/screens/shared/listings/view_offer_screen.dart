import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/theme/colors.dart';
import 'package:pocadot_client/widgets/navigation/stack_app_bar.dart';

class ViewOfferAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  ViewOfferAppBar({super.key}) : preferredSize = const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: PocadotColors.greyscale50,
        elevation: 1,
        centerTitle: true,
        title: Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "View Offer",
                style: TextStyle(
                    color: PocadotColors.primary500, fontFamily: 'Jua'),
              ),
              Text(
                "Momo · Formula of Love",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: PocadotColors.greyscale900,
                  fontSize: 16,
                  fontFamily: "Urbanist",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 89,
                height: 16,
                child: Text(
                  "View Listing",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: PocadotColors.primary500,
                    fontSize: 10,
                    fontFamily: "Urbanist",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: PocadotColors.primary500),
          onPressed: () {
            if (Navigator.canPop(context)) Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(IconlyLight.more_circle,
                color: PocadotColors.primary500),
            onPressed: () {},
          ),
        ]);
  }
}

class ViewOfferContent extends StatefulWidget {
  const ViewOfferContent({super.key});

  @override
  State<ViewOfferContent> createState() => _ViewOfferContentState();
}

class _ViewOfferContentState extends State<ViewOfferContent> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('View Offer',
          style: TextStyle(color: PocadotColors.greyscale900)),
    );
  }
}

class ViewOfferScreen extends HookWidget {
  const ViewOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViewOfferAppBar(),
      body: const ViewOfferContent(),
    );
  }
}
