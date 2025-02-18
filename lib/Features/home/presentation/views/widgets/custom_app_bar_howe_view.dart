
import 'package:book_app/Core/utilities/app_router.dart';
import 'package:book_app/Core/utilities/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
          left: width * 0.05,
          right: width * 0.05,
          top: height * 0.02,
          bottom: height * 0.029),
      child: Row(
        children: [
          Image.asset(
            AssetsData.logo,
            height: height * 0.032,
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.ksearchview);
            },
            icon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: height * 0.035,
            ),
          ),
        ],
      ),
    );
  }
}
