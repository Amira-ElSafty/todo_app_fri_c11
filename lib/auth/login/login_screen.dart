import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo_fri_c11/app_colors.dart';
import 'package:flutter_app_todo_fri_c11/auth/custome_text_form_field.dart';
import 'package:flutter_app_todo_fri_c11/auth/register/register_screen.dart';
import 'package:flutter_app_todo_fri_c11/dialog_utils.dart';
import 'package:flutter_app_todo_fri_c11/firebase_utils.dart';
import 'package:flutter_app_todo_fri_c11/home/home_screen.dart';
import 'package:provider/provider.dart';

import '../../provider/user_provider.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login_screen';

  TextEditingController emailController =
      TextEditingController(text: 'amira@route.com');
  TextEditingController passwordController =
      TextEditingController(text: '123456');
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Welcome Back!',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                login(context);
                              },
                              child: Text(
                                'Login',
                                style: Theme.of(context).textTheme.titleLarge,
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
    );
  }

  void login(BuildContext context) async {
    if (formKey.currentState?.validate() == true) {
      // register
      //todo: show loading
      DialogUtils.showLoading(context: context, message: 'Waiting...');
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        var user = await FirebaseUtils.readUserFromFireStore(
            credential.user?.uid ?? '');
        if (user == null) {
          return;
        }
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.updateUser(user);
        //todo: hide loading
        DialogUtils.hideLoading(context);
        //todo: show Message
        DialogUtils.showMessage(
            context: context,
            content: 'Login Successfully',
            title: 'Success',
            posActionName: 'Ok',
            posAction: () {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            });

        print('login successfully');
        print(credential.user?.uid ?? "");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-credential') {
          //todo: hide loading
          DialogUtils.hideLoading(context);
          //todo: show Message
          DialogUtils.showMessage(
              context: context,
              content:
                  'The supplied auth credential is incorrect, malformed or has expired',
              title: 'Error',
              posActionName: 'Ok');
          print(
              'The supplied auth credential is incorrect, malformed or has expired');
        } else if (e.code == 'network-request-failed') {
          //todo: hide loading
          DialogUtils.hideLoading(context);
          //todo: show Message
          DialogUtils.showMessage(
              context: context,
              content:
                  'A network error (such as timeout, interrupted connection or unreachable host) has occurred.',
              title: 'Error',
              posActionName: 'Ok');
          print('The account already exists for that email.');
        }
      } catch (e) {
        //todo: hide loading
        DialogUtils.hideLoading(context);
        //todo: show Message
        DialogUtils.showMessage(
            context: context,
            content: e.toString(),
            title: 'Error',
            posActionName: 'Ok');
        print(e);
      }
    }
  }
}
