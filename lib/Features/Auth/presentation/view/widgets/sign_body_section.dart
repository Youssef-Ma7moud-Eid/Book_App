
import 'package:book_app/Core/utilities/app_router.dart';
import 'package:book_app/Features/Auth/data/repo/repo_implement.dart';
import 'package:book_app/Features/Auth/presentation/view/widgets/custom_button_auth.dart';
import 'package:book_app/Features/Auth/presentation/view/widgets/text_field.dart';
import 'package:book_app/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class SignBodySection extends StatefulWidget {
  const SignBodySection({super.key});

  @override
  State<SignBodySection> createState() => _SignBodySectionState();
}

class _SignBodySectionState extends State<SignBodySection> {
  String Email = "";
  String Password = "";
  String Name = "";
  GlobalKey<FormState> formState = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Form(
      key: formState,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: EdgeInsets.only(top: height * 0.3),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: height * 0.01, left: width * 0.07, right: width * 0.07),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFieldAuth(
                    text: 'Name',
                    onChanged: (name) {
                      Name = name;
                    },
                  ),
                  SizedBox(
                    height: height * 0.045,
                  ),
                  TextFieldAuth(
                    onChanged: (email) async {
                      Email = email;

                      setState(() {});
                    },
                    text: 'Gmail',
                  ),
                  SizedBox(
                    height: height * 0.045,
                  ),
                  TextFieldAuth(
                    onChanged: (password) async {
                      Password = password;
                      setState(() {});
                    },
                    text: 'Password',
                  ),
                  SizedBox(
                    height: height * 0.07,
                  ),
                  CustomButtonAuth(
                    text: 'SIGN UP',
                    onTap: () async {
                      if (formState.currentState!.validate()) {
                        dynamic message = await AuthRepoImplement()
                            .createUserWithEmailAndPassword(
                                email: Email, password: Password);

                        if (message == null) {
                          mybox!.put('person', [Name, Email]);

                          QuickAlert.show(
                              context: context,
                              type: QuickAlertType.success,
                              title: 'Success!',
                              text: 'You have Sign Up successfully.',
                              confirmBtnText: 'OK',
                              onConfirmBtnTap: () async {
                                Navigator.of(context).pop();
                               

                                GoRouter.of(context)
                                    .pushReplacement(AppRouter.kloginview);
                              });
                        } else {
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            title: 'Error!',
                            text: message,
                            confirmBtnText: 'OK',
                          );
                        }
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.06,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Do you have an account?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.009,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context)
                            .pushReplacement(AppRouter.kloginview);
                      },
                      child: Text(
                        "sign in",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
