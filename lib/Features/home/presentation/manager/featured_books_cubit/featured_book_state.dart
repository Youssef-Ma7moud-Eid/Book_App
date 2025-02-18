part of 'featured_books_cubit.dart';

abstract class FeaturedbookscubitState extends Equatable {
  const FeaturedbookscubitState();

  @override
  List<Object> get props => [];
}

class FeaturedBooksInitial extends FeaturedbookscubitState {}

class FeaturedBooksLoading extends FeaturedbookscubitState {}

class FeaturedBooksSuccess extends FeaturedbookscubitState {
  final List<BookModel> books;

  const FeaturedBooksSuccess({required this.books});
}

class FeaturedBooksFailure extends FeaturedbookscubitState {
  final String errormessage;

  const FeaturedBooksFailure({required this.errormessage});
}
