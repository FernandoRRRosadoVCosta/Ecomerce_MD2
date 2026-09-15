import 'package:flutter/material.dart';
import 'banner_item.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({
    super.key,
  });

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  final List<Map<String, String>> banners = [
    {
      'title': 'Aproveite as ofertas',
      'imageUrl':
          'https://i.postimg.cc/Cx0RBnLN/banner-png.png',
    },
    {
      'title': 'Experimente agora!',
      'imageUrl':
          'https://i.postimg.cc/kGFdkGrw/2banner-png.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: PageView.builder(
            controller: _pageController,
            itemCount: banners.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final banner = banners[index];

              return BannerItem(
                title: banner['title']!,
                imageUrl: banner['imageUrl']!,
              );
            },
          ),
        ),

        const SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            banners.length,
            (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? Colors.black
                      : Colors.grey,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}