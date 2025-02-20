import 'package:book_app/Core/bloc_observer/bloc_observer.dart';
import 'package:book_app/Core/utilities/app_router.dart';
import 'package:book_app/Core/utilities/constants.dart';
import 'package:book_app/Core/utilities/services_locator.dart';
import 'package:book_app/Features/home/data/repos/home_repo_implent.dart';
import 'package:book_app/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_app/Features/home/presentation/manager/newest%20books%20cubit/newest_books_cubit.dart';
import 'package:book_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Box? mybox;
Future<Box> openHiveBox(String boxname) async {
  if (!Hive.isBoxOpen(boxname)) {
    Hive.init((await getApplicationDocumentsDirectory()).path);
  }
  return await Hive.openBox(boxname);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  mybox = await openHiveBox('personinfo');
  SetupServicesLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 Bloc.observer = AppBlocObserver();
 runApp(const BooklyApp());
  
  
 
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => Featuredbookcubit(
            getIt.get<HomeRepoImplent>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImplent>(),
          )..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
