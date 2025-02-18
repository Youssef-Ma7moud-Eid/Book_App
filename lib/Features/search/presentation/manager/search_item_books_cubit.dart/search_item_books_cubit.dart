
import 'package:book_app/Features/home/data/models/book_model/book.model.dart';
import 'package:book_app/Features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_item_books_state.dart';

class SearchItemBooksCubit extends Cubit<SearchItemBooksState> {
  SearchItemBooksCubit({required this.searchrepo})
      : super(SearchItemBooksInitial());
  final SearchRepo searchrepo;

  Future<void> SearchItemBooks(String catagory) async {
    if (catagory.isNotEmpty) {
      emit(SearchItemBooksLoading());
      var result = await searchrepo.fetchItemsSearch(catagory: catagory);

      result.fold(
          (failure) => emit(
                SearchItemBooksFauilre(errormessage: failure.errMessage),
              ), (featuredbooks) {
        if (featuredbooks.isNotEmpty) {
          emit(
            SearchItemBooksInitiaSuccess(books: featuredbooks),
          );
        } else {
          emit(SearchItemBooksNoBooks());
        }
      });
    } else {
      emit(SearchItemBooksInitial());
    }
  }
}
