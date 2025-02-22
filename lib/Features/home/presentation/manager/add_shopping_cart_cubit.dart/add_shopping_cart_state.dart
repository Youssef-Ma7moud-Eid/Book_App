part of 'add_shopping_cart_cubit.dart';

abstract class AddShoppingCartState extends Equatable {
  const AddShoppingCartState();

  @override
  List<Object> get props => [];
}

class AddShoppingCartInitial extends AddShoppingCartState {}

class AddShoppingCartSuccess extends AddShoppingCartState {
 final Set<BookModel> list;
  const AddShoppingCartSuccess({ required this.list});
}
