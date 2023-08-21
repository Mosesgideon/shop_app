import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/screens/auth/bloc/auth_bloc.dart';
import 'package:food_app/features/screens/auth/data/auth_repository/auth_repository_impl.dart';
import 'package:food_app/features/screens/auth/signup/sign_up_screen.dart';
import 'package:food_app/features/screens/auth/widgets/button.dart';
import 'package:food_app/features/screens/auth/widgets/textfilled_widget.dart';
import 'package:food_app/features/screens/dashboard/presentations/dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroler = TextEditingController();
  final passwordcontroler = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final authbloc = AuthBloc(AuthRepositoryIMPL());
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SafeArea(
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Welcome back, enter your details to continue',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    OutlinedFormField(
                      controller: emailcontroler,
                      hint: 'email',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    OutlinedFormField(
                      controller: passwordcontroler,
                      hint: 'password',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'forget password',
                              style: TextStyle(color: Colors.black),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (index) => const SignUpScreen()));
                            },
                            child: const Text(
                              'don\'t have an account',
                              style: TextStyle(color: Colors.black),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    BlocConsumer<AuthBloc, AuthState>(
                      bloc: authbloc,
                      listener: (context, state) {
                        if (state is AuthLoadingState) {
                          setState(() {
                            isloading = true;
                          });
                          log('loading');
                        }
                        if (state is AuthLoginSuccessState) {
                          setState(() {
                            isloading = false;
                          });
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (index) => Dashboard()));
                        }
                        if (state is AuthFailureState) {
                          setState(() {
                            isloading = false;
                          });
                          log(state.error);
                        }
                      },
                      builder: (context, state) {
                        return CustomButton(
                          bgColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          onPressed: () {
                            loginUser();
                          },
                          child: isloading
                              ? const SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: CircularProgressIndicator())
                              : const Text('Login'),
                        );
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void loginUser() {
    if (_formkey.currentState!.validate()) {
      if (passwordcontroler.text.isEmpty || emailcontroler.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "fields can't be empty",
          style: TextStyle(color: Colors.red),
        )));
        setState(() {
          isloading = false;
        });
      }
      authbloc.add(LoginEvent(
          passwordcontroler.text.trim(), emailcontroler.text.trim()));
    }
  }
}
