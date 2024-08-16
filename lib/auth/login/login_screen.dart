import 'package:flutter/material.dart';
import 'package:flutter_app_todo_fri_c11/app_colors.dart';
import 'package:flutter_app_todo_fri_c11/auth/custome_text_form_field.dart';
import 'package:flutter_app_todo_fri_c11/auth/login/login_navigator.dart';
import 'package:flutter_app_todo_fri_c11/auth/login/login_screen_view_model.dart';
import 'package:flutter_app_todo_fri_c11/auth/register/register_screen.dart';
import 'package:flutter_app_todo_fri_c11/dialog_utils.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginNavigator {

  LoginScreenViewModel viewModel = LoginScreenViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Stack(
        children: [
          Container(
            color: AppColors.backgroundLightColor,
            child: Image.asset(
              'assets/images/main_background.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text('Login'),
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                      key: viewModel.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.2,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Welcome Back!',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium,
                            ),
                          ),
                          CustomTextFormField(
                            label: 'Email',
                            controller: viewModel.emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (text) {
                              if (text == null || text
                                  .trim()
                                  .isEmpty) {
                                return 'Please enter Email.';
                              }
                              final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(text);
                              if (!emailValid) {
                                return 'Please enter valid email.';
                              }
                              return null;
                            },
                          ),
                          CustomTextFormField(
                            label: 'Password',
                            controller: viewModel.passwordController,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            validator: (text) {
                              if (text == null || text
                                  .trim()
                                  .isEmpty) {
                                return 'Please enter Password.';
                              }
                              if (text.length < 6) {
                                return 'Password should be at least 6 chars.';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  viewModel.login();
                                },
                                child: Text(
                                  'Login',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge,
                                )),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(RegisterScreen.routeName);
                              },
                              child: Text("OR Create Account"))
                        ],
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


  @override
  void hideMyLoading() {
    DialogUtils.hideLoading(context);
  }

  @override
  void showMyLoading(String message) {
    DialogUtils.showLoading(context: context, message: message);
  }

  @override
  void showMyMessage(String message) {
    DialogUtils.showMessage(context: context, content: message,
        posActionName: 'Ok');
  }

}
