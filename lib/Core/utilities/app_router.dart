// ignore_for_file: unnecessary_null_in_if_null_operators
import 'package:book_app/Core/utilities/services_locator.dart';
import 'package:book_app/Features/Auth/presentation/view/login_view.dart';
import 'package:book_app/Features/Auth/presentation/view/sign_up_view.dart';
import 'package:book_app/Features/Splash%20feature/presentation/views/splash_view.dart';
import 'package:book_app/Features/home/data/models/book_model/book.model.dart';
import 'package:book_app/Features/home/data/repos/home_repo_implent.dart';
import 'package:book_app/Features/home/presentation/manager/similar_books_cubit/cubit/similar_books_cubit.dart';
import 'package:book_app/Features/home/presentation/views/book_details_view.dart';
import 'package:book_app/Features/home/presentation/views/home_view.dart';
import 'package:book_app/Features/home/presentation/views/shooping_view.dart';
import 'package:book_app/Features/onboarding_screen/presentation/views/boarding_screen_view.dart';
import 'package:book_app/Features/search/data/repos/search_repo_implement.dart';
import 'package:book_app/Features/search/presentation/manager/search_item_books_cubit.dart/search_item_books_cubit.dart';
import 'package:book_app/Features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// OnBoardingScreenView
abstract class AppRouter {
  static const kHomeView = '/HomeView';
  static const kbookDetailview = '/BookDetail';
  static const ksearchview = '/SearchView';
  static const konboardingview = '/OnBoarding';
  static const kloginview = '/Login';
   static const ksignupview = '/Signup';
    static const kshoppingview = '/Shopping';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return SplashView();
        },
      ),
      GoRoute(
        path: konboardingview,
        builder: (BuildContext context, GoRouterState state) {
          return OnBoardingScreenView();
        },
      ),
       GoRoute(
        path:kloginview,
        builder: (BuildContext context, GoRouterState state) {
          return LoginView();
        },
      ),
       GoRoute(
        path:ksignupview,
        builder: (BuildContext context, GoRouterState state) {
          return SignUpView();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return HomeView();
        },
      ),
         GoRoute(
        path: kshoppingview,
        builder: (BuildContext context, GoRouterState state) {
          return ShoppingView();
        },
      ),
      GoRoute(
        path: kbookDetailview,
        builder: (BuildContext context, GoRouterState state) {
          final BookModel bookModel = state.extra as BookModel;
          return BlocProvider(
            create: (context) => SimilarBooksCubit(
              getIt.get<HomeRepoImplent>(),
            )..fetchSimilarBooks(
                catagory: bookModel.volumeInfo.categories?[0] ?? null),
            child: BookDetailsView(
              bookModel: bookModel,
            ),
          );
        },
      ),
      GoRoute(
        path: ksearchview,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => SearchItemBooksCubit(
                searchrepo: getIt.get<SearchRepoImplement>()),
            child: SearchView(),
          );
        },
      ),
    ],
  );
}
