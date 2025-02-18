import 'package:book_app/Core/errors/fauilers.dart';
import 'package:book_app/Core/utilities/apis_services.dart';
import 'package:book_app/Features/home/data/models/book_model/book.model.dart';
import 'package:book_app/Features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplement implements SearchRepo {
      final ApisServices apisServices;

  SearchRepoImplement({required this.apisServices});

  @override
  Future<Either<Fauilers, List<BookModel>>> fetchItemsSearch(
      {required String catagory}) async {
    try {
      var data = await apisServices.get(
          endpoint:
              'volumes?Filtering=free-ebooks&q=Intitle:$catagory');
      List<BookModel> books = [];
      if(data["items"]!=null)
      {
for (dynamic item in data["items"]) {
        if(item!=null)
        {
            books.add(BookModel.fromResponse(item));
        }
       
      }
     
      }
      
       return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFauilre.DioException(e));
      } else {
        return left(ServerFauilre(e.toString()));
      }
    }
  }
}
