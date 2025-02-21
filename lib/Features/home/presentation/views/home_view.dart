import 'package:book_app/Features/home/presentation/views/widgets/custom_drawer.dart';
import 'package:book_app/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: HomeViewBody(),
    );
  }
}
