import 'package:cached_network_image/cached_network_image.dart';
import 'package:day60/models/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  late User user;
  late CarouselSliderController _sliderController;

  @override
  void initState() {
    _sliderController = CarouselSliderController();

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.black,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: CarouselSlider.builder(
                controller: _sliderController,
                unlimitedMode: true,
                slideBuilder: (index) {
                  return CachedNetworkImage(
                    imageUrl: user.stories![index].url,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  );
                },
                slideTransform: CubeTransform(),
                slideIndicator: CircularSlideIndicator(
                  padding: EdgeInsets.only(bottom: 32),
                  indicatorRadius: 10,
                  currentIndicatorColor: Colors.white,
                  indicatorBorderColor: Colors.grey.shade700,
                  itemSpacing: 30,
                  indicatorBackgroundColor: Colors.grey.shade700
                ),
                itemCount: user.stories!.length
              )
            )
          ],
        )
      )
    );
  }
}
