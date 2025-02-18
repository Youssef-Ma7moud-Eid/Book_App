import 'package:flutter/material.dart';

class ViewDetails extends StatelessWidget {
  const ViewDetails({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.backgroundColor,
  });
  final String image;
  final String title;
  final String subtitle;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height * 0.47,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),

          // Title
          SizedBox(
            width: width*0.7,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
           SizedBox(height: height*0.01),

          // Subtitle
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: width*0.03),
            child: Text(
              subtitle,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
          ),
           SizedBox(height: height*0.2),

          // Next Button
        ],
      ),
    );
  }
}
