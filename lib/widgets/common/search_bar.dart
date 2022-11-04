import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pocadot_client/theme/colors.dart';

class SearchBar extends StatefulWidget {
  final FocusNode? focusNode;
  final TextEditingController textController;
  final String hintText;
  final bool? autofocus;

  const SearchBar(
      {required this.textController,
      required this.hintText,
      Key? key,
      this.focusNode, this.autofocus})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
    widget.textController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

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
          autofocus: widget.autofocus ?? false,
          autocorrect: false,
          focusNode: _focusNode,
          controller: widget.textController,
          onChanged: (value) {
            //Do something wi
          },
          decoration: InputDecoration(
            prefixIcon: Icon(
              IconlyLight.search,
              color: _focusNode.hasFocus
                  ? PocadotColors.primary500
                  : PocadotColors.greyscale400,
            ),
            suffixIcon: widget.textController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.close, color: PocadotColors.primary500),
                    onPressed: () {
                      widget.textController.clear();
                    },
                  )
                : null,
            filled: true,
            fillColor: _focusNode.hasFocus
                ? PocadotColors.transparentBlue
                : PocadotColors.greyscale100,
            hoverColor: _focusNode.hasFocus
                ? PocadotColors.transparentBlue
                : PocadotColors.greyscale100,
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: PocadotColors.greyscale400),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: _focusNode.hasFocus
                      ? PocadotColors.primary500
                      : PocadotColors.greyscale100,
                  width: 1.0),
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: _focusNode.hasFocus
                      ? PocadotColors.primary500
                      : PocadotColors.greyscale100,
                  width: 1.0),
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
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
