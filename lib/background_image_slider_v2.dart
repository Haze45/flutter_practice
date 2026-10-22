import 'package:flutter/material.dart';

class BackgroundImageSliderCarousel extends StatefulWidget {
  const BackgroundImageSliderCarousel({super.key});

  @override
  State<BackgroundImageSliderCarousel> createState() =>
      _BackgroundImageSliderCarouselState();
}

class _BackgroundImageSliderCarouselState
    extends State<BackgroundImageSliderCarousel> {

  // List of images
  final List<String> images = [
    'assets/pexels-sebastiaan9977-1480690.jpg',
    'assets/pexels-stywo-1261728.jpg',
    'assets/sebastian-svenson-d2w-_1LJioQ-unsplash.jpg',
    'assets/—Pngtree—blade and blood moon_16536658.jpg',
    'assets/—Pngtree—surreal landscape floating rock island_16243391.jpg',
  ];

  // Controls which image is currently displayed
  int imageIndex = 0;

  // Controller for the carousel
  late PageController pageController;

  @override
  void initState() {
    super.initState();

    pageController = PageController(
      initialPage: imageIndex,
    );
  }

  // Move to previous image
  void previousImage() {
    if (imageIndex > 0) {
      imageIndex--;
    } else {
      imageIndex = images.length - 1;
    }

    pageController.animateToPage(
      imageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // Move to next image
  void nextImage() {
    if (imageIndex < images.length - 1) {
      imageIndex++;
    } else {
      imageIndex = 0;
    }

    pageController.animateToPage(
      imageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Background Image Carousel'),
      ),

      body: Stack(
        children: [

          // Image carousel
          PageView.builder(
            controller: pageController,

            itemCount: images.length,

            onPageChanged: (index) {
              setState(() {
                imageIndex = index;
              });
            },

            itemBuilder: (context, index) {
              return Image.asset(
                images[index],
                fit: BoxFit.cover,
              );
            },
          ),

          // Left and right buttons
          Align(
            alignment: Alignment.center,

            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

              children: [

                // LEFT button
                IconButton(
                  onPressed: previousImage,
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 40,
                    color: Colors.white,
                  ),
                ),

                // RIGHT button
                IconButton(
                  onPressed: nextImage,
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // Image number indicator
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,

            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 8,
                ),

                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Text(
                  '${imageIndex + 1} / ${images.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}