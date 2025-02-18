import 'package:book_app/Core/errors/fauilers.dart';
import 'package:book_app/Features/home/data/models/book_model/book.model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo // Reposity pattern to create abstract class
{
  Future<Either<Fauilers, List<BookModel>>> fetchItemsSearch({required String catagory});
}
