part of 'search_item_books_cubit.dart';

sealed class SearchItemBooksState extends Equatable {
  const SearchItemBooksState();

  @override
  List<Object> get props => [];
}

class SearchItemBooksInitial extends SearchItemBooksState {}

class SearchItemBooksLoading extends SearchItemBooksState {}
class SearchItemBooksNoBooks extends SearchItemBooksState {}
class SearchItemBooksInitiaSuccess extends SearchItemBooksState {
  final List<BookModel> books;

  const SearchItemBooksInitiaSuccess({required this.books});
}

class SearchItemBooksFauilre extends SearchItemBooksState {
  final String errormessage;

  const SearchItemBooksFauilre({required this.errormessage});
}
