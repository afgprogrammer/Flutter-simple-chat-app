import 'package:day60/shared/constants/color_constants.dart';
import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  final String image;
  const StoryWidget({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: ColorConstants.storyHighlightColor, width: 2),
      ),
      child: CircleAvatar(
        backgroundImage: Image.network(image, fit: BoxFit.cover,).image,
      ),
    );
  }
}
