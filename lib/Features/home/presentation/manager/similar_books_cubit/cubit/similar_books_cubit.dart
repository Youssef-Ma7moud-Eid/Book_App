
import 'package:book_app/Features/home/data/models/book_model/book.model.dart';
import 'package:book_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<FetchSimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(FetchSimilarBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchSimilarBooks({required String ? catagory}) async {
    emit(FetchSimilarBooksLoading());
    dynamic result = await homeRepo.fetchSimilarBooks(catagory: catagory);
    if (result != null) {
      result.fold(
          (failure) =>
              emit(FetchSimilarBooksFauilre(errormessage: failure.errMessage)),
          (featuredbooks) =>
              emit(FetchSimilarBooksSuccess(bookmodel: featuredbooks)));
    }
  }
}
