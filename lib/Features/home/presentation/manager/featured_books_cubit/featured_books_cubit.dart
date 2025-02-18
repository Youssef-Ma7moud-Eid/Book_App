import 'package:book_app/Features/home/data/models/book_model/book.model.dart';
import 'package:book_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_book_state.dart';

class Featuredbookcubit extends Cubit<FeaturedbookscubitState> {
  Featuredbookcubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
        (failure) =>
            emit(FeaturedBooksFailure(errormessage: failure.errMessage)),
        (featuredbooks) => emit(FeaturedBooksSuccess(books: featuredbooks)));
  }
}
