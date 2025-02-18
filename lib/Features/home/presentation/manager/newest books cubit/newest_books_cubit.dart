import 'package:book_app/Features/home/data/models/book_model/book.model.dart';
import 'package:book_app/Features/home/data/repos/home_repo.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksCubitState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewestBooks();
    result.fold(
        (failure) => emit(NewestBooksFailure(errormessage: failure.errMessage)),
        (featuredbooks) => emit(NewestBooksSuccess(books: featuredbooks)));
  }
}
