import 'package:flutter/material.dart';
import 'package:flutter_app_todo_fri_c11/app_colors.dart';
import 'package:flutter_app_todo_fri_c11/auth/custome_text_form_field.dart';
import 'package:flutter_app_todo_fri_c11/auth/register/register_navigator.dart';
import 'package:flutter_app_todo_fri_c11/auth/register/register_screen_view_model.dart';
import 'package:flutter_app_todo_fri_c11/dialog_utils.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register_screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    implements RegisterNavigator {
  TextEditingController nameController = TextEditingController(text: 'Amira');

  TextEditingController emailController =
      TextEditingController(text: 'amira@route.com');

  TextEditingController passwordController =
      TextEditingController(text: '123456');

  TextEditingController confirmPasswordController =
      TextEditingController(text: '123456');

  var formKey = GlobalKey<FormState>();

  RegisterScreenViewModel viewModel = RegisterScreenViewModel();

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
              title: Text('Create Account'),
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                          ),
                          CustomTextFormField(
                            label: 'User Name',
                            controller: nameController,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Please enter User Name.';
                              }
                              return null;
                            },
                          ),
                          CustomTextFormField(
                            label: 'Email',
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
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
                            controller: passwordController,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Please enter Password.';
                              }
                              if (text.length < 6) {
                                return 'Password should be at least 6 chars.';
                              }
                              return null;
                            },
                          ),
                          CustomTextFormField(
                            label: 'Confirm Password',
                            controller: confirmPasswordController,
                            keyboardType: TextInputType.phone,
                            obscureText: true,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Please enter Confirm Password.';
                              }
                              if (text != passwordController.text) {
                                return "Confirm Password doesn't match password";
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  register(context);
                                },
                                child: Text(
                                  'Create Account',
                                  style: Theme.of(context).textTheme.titleLarge,
                                )),
                          )
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

  void register(BuildContext context) async {
    if (formKey.currentState?.validate() == true) {
      // register
      viewModel.register(emailController.text, passwordController.text);
    }
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
    DialogUtils.showMessage(
        context: context, content: message, posActionName: 'Ok');
  }
}
