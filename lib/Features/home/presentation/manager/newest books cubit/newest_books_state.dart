part of 'newest_books_cubit.dart';

abstract class NewestBooksCubitState extends Equatable {
  const NewestBooksCubitState();

  @override
  List<Object> get props => [];
}

class NewestBooksInitial extends NewestBooksCubitState {}

class NewestBooksLoading extends NewestBooksCubitState {}

class NewestBooksSuccess extends NewestBooksCubitState {
  final List<BookModel> books;

  const NewestBooksSuccess({required this.books});
}

class NewestBooksFailure extends NewestBooksCubitState {
  final String errormessage;

  const NewestBooksFailure({required this.errormessage});
}
