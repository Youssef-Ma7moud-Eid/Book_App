import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_shopping_cart_state.dart';

class AddShoppingCartCubit extends Cubit<AddShoppingCartState> {
  AddShoppingCartCubit() : super(AddShoppingCartInitial());
}
