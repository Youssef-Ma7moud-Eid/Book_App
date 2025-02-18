import 'package:book_app/Core/utilities/apis_services.dart';
import 'package:book_app/Features/home/data/repos/home_repo_implent.dart';
import 'package:book_app/Features/search/data/repos/search_repo_implement.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance; //  انشاء نسخه

void
    SetupServicesLocator() //  انشاء  الاشياء (methodes & objects  & services)الي محتاج اعمل نسخ  كتير ف التطبيق منها
{
  getIt.registerSingleton<ApisServices>(
    ApisServices(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImplent>(
    HomeRepoImplent(
      apisServices: getIt.get<ApisServices>(),
    ),
  );
  getIt.registerSingleton<SearchRepoImplement>(
    SearchRepoImplement(
      apisServices: getIt.get<ApisServices>(),
    ),
  );
}
