import 'package:book_app/Core/theme/cubit/theme_cubit.dart';
import 'package:book_app/Core/utilities/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    var mode = ThemeCubit.get(context).currentTheme;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return  Container(
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.02,
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                 
                  var newThemeMode = mode == ThemeModeState.dark
                      ? ThemeModeState.light
                      : ThemeModeState.dark;
                  ThemeCubit.get(context).setTheme(newThemeMode);
            setState(() {
              
            });
                },
                icon: Icon(
                  mode == ThemeModeState.dark
                      ? Icons.sunny 
                      : Icons.nightlight_round, 
                  size: height * 0.035,
                ),
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
