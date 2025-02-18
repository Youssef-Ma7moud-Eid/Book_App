part of 'similar_books_cubit.dart';

sealed class FetchSimilarBooksState extends Equatable {
  const FetchSimilarBooksState();

  @override
  List<Object> get props => [];
}

class FetchSimilarBooksInitial extends FetchSimilarBooksState {}

class FetchSimilarBooksSuccess extends FetchSimilarBooksState {
  final List<BookModel> bookmodel;

  const FetchSimilarBooksSuccess({required this.bookmodel});
}

class FetchSimilarBooksFauilre extends FetchSimilarBooksState {
  final String errormessage;

  const FetchSimilarBooksFauilre({required this.errormessage});
}

class FetchSimilarBooksLoading extends FetchSimilarBooksState {}
