import 'package:book_app/Features/home/data/models/book_model/book.model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_shopping_cart_state.dart';

class AddShoppingCartCubit extends Cubit<AddShoppingCartState> {
  AddShoppingCartCubit() : super(AddShoppingCartInitial());
  Set<BookModel> models = {};
  void addBooks(BookModel model) {
    models.add(model);
  }

  void deleteBook(BookModel model) {
    models.remove(model);
    getBooks();
  }

  void getBooks() {
    if (models.isEmpty) {
      emit(AddShoppingCartInitial());
    } else {
      emit(AddShoppingCartSuccess(list: models));
    }
  }
}
