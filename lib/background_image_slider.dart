import 'package:flutter/material.dart';

class BackgroundImageSlider extends StatefulWidget {
  const BackgroundImageSlider({super.key});

  @override
  State<BackgroundImageSlider> createState() =>
      _BackgroundImageSliderState();
}

class _BackgroundImageSliderState
    extends State<BackgroundImageSlider> {

  // List of five images
  final List<String> images = [
    'assets/pexels-sebastiaan9977-1480690.jpg',
    'assets/pexels-stywo-1261728.jpg',
    'assets/sebastian-svenson-d2w-_1LJioQ-unsplash.jpg',
    'assets/—Pngtree—blade and blood moon_16536658.jpg',
    'assets/—Pngtree—surreal landscape floating rock island_16243391.jpg',
  ];

  // Current image
  int imageIndex = 0;

  // Move to previous image
  void previousImage() {
    setState(() {
      imageIndex--;

      // If we go before image 1,
      // go back to image 5
      if (imageIndex < 0) {
        imageIndex = images.length - 1;
      }
    });
  }

  // Move to next image
  void nextImage() {
    setState(() {
      imageIndex++;

      // If we go after image 5,
      // go back to image 1
      if (imageIndex >= images.length) {
        imageIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Background Image Slider'),
      ),

      body: Stack(
        children: [

          // Background image
          Positioned.fill(
            child: Image.asset(
              images[imageIndex],
              fit: BoxFit.cover,
            ),
          ),

          // Buttons
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

              children: [

                // Left button
                IconButton(
                  onPressed: previousImage,
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: Colors.white,
                  ),
                ),

                // Right button
                IconButton(
                  onPressed: nextImage,
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}