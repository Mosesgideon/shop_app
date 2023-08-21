import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/screens/auth/bloc/auth_bloc.dart';
import 'package:food_app/features/screens/auth/data/auth_repository/auth_repository_impl.dart';
import 'package:food_app/features/screens/auth/data/model/register_payload.dart';
import 'package:food_app/features/screens/auth/login/screens/login_screen.dart';
import 'package:food_app/features/screens/auth/widgets/button.dart';
import 'package:food_app/features/screens/auth/widgets/textfilled_widget.dart';
import 'package:food_app/features/screens/dashboard/presentations/dashboard.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final namecontroler = TextEditingController();
  final emailcontroler = TextEditingController();
  final passwordcontroler = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final authbloc = AuthBloc(AuthRepositoryIMPL());
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
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
                        'SignUp',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Create an account with us to get started.',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      OutlinedFormField(
                        controller: namecontroler,
                        hint: 'name',
                      ),
                      const SizedBox(
                        height: 15,
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
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(CupertinoPageRoute(
                                builder: (index) => const LoginScreen()));
                          },
                          child: const Text(
                            'already have an account',
                            style: TextStyle(color: Colors.black),
                          )),
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
                          if (state is AuthRegisterSuccessState) {
                            Navigator.of(context).push(CupertinoPageRoute(
                                builder: (index) => const Dashboard()));
                            setState(() {
                              isloading = false;
                            });
                            log('success');
                            log(state.response.toJson().toString());
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
                              signUpUser();
                              // Navigator.of(context).push(CupertinoPageRoute(
                              //     builder: (index) => const Dashboard()));
                            },
                            child: isloading
                                ? const SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: CircularProgressIndicator(),
                                  )
                                : const Text('SignUp'),
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
      ),
    );
  }

  void signUpUser() {
    if (_formkey.currentState!.validate()) {
      authbloc.add(RegisterEvent(RegisterPayload(
          email: emailcontroler.text,
          firstname: namecontroler.text,
          password: passwordcontroler.text,
          lastname: 'gideon',
          phone: '07042973460',
          username: 'mosesgideon')));
    }
  }
}
