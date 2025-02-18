import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingItem extends StatelessWidget {
  const ShimmerLoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.21,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 0.68,
            child: Shimmer.fromColors(
                 baseColor: Colors.grey[600]!, // Darker base color
                  highlightColor: const Color.fromARGB(11, 236, 230, 230), 
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(220, 224, 224, 224),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          // color: const Color.fromARGB(220, 224, 224, 224),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.075,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[600]!, // Darker base color
                  highlightColor: Colors.yellowAccent, // Brighter highlight color
                  child: Container(
                    height: 20,
                    width: double.infinity,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[600]!,
                      highlightColor: Colors.yellowAccent,
                      child: Container(
                        height: 16,
                        width: 100,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 4),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[600]!,
                      highlightColor: Colors.yellowAccent,
                      child: Container(
                        height: 16,
                        width: 80,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[600]!,
                      highlightColor: Colors.yellowAccent,
                      child: Container(
                        height: 20,
                        width: 50,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.15),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[600]!,
                      highlightColor: Colors.yellowAccent,
                      child: Container(
                        height: 20,
                        width: 30,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}