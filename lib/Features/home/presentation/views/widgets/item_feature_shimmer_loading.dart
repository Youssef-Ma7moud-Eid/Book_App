import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ItemFeatureShimmerLoading extends StatelessWidget {
  const ItemFeatureShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.65,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[600]!, // Darker base color
        highlightColor: const Color.fromARGB(11, 236, 230, 230),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset('assets/images/test_image.png', fit: BoxFit.fill),
        ),
      ),
    );
  }
}
