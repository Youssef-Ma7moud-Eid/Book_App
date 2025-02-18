import 'package:book_app/Features/search/presentation/manager/search_item_books_cubit.dart/search_item_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (String  Bookname) {
      
        BlocProvider.of<SearchItemBooksCubit>(context).SearchItemBooks(Bookname);
      },
      cursorHeight: 20,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Opacity(
            opacity: 0.8,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 23,
            ),
          ),
        ),
        label: Text('Search'),
        hintText: "Enter your book name",
        contentPadding: EdgeInsets.all(8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
