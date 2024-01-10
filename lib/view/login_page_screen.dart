import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import '../controller/services/user_provider.dart';
import './registration_page_screen.dart';
import './widgets/my_button.dart';
import './widgets/squire_tile.dart';
import 'home_page_screen.dart';
import 'navigator.dart';

class LoginPageScreen extends StatefulWidget {
  static const routeName = '/loginPage';
  const LoginPageScreen({super.key});

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();
  late UserProvider userProvider;
  String _errMsg = '';
  bool callOnce = false;
  bool foundUser = false;

  @override
  void didChangeDependencies() {
    if (!callOnce) {
      userProvider = Provider.of<UserProvider>(context);
      callOnce = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 5),
                Image.asset(
                  'assets/images/janbahonWhite.png',
                  height: mediaQuery.size.height * .24,
                  width: mediaQuery.size.width * .42,
                ),

                Form(
                  key: _loginFormKey,
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    shrinkWrap: true,
                    children: [
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        child: TextFormField(
                          controller: emailController,
                          // keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.grey.shade500),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Provide a valid email address';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        child: TextFormField(
                          style: Theme.of(context).textTheme.titleMedium,
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          // obscureText: true,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey.shade500),
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 6) {
                              return 'Provide a valid password';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _errMsg,
                          style:
                              const TextStyle(fontSize: 18, color: Colors.red),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),

                // const SizedBox(height: 25),
                // MyTextFiled(
                //   controller: emailController,
                //   hintText: 'Username',
                //   obscureText: false,
                // ),
                // const SizedBox(height: 10),
                // MyTextFiled(
                //   controller: passwordController,
                //   hintText: 'Pasword',
                //   obscureText: true,
                // ),

                // password forget
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forget Password?',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
                //end here

                const SizedBox(height: 25),
                MyButton(
                  onTap: () {
                    _loginAuth();
                    // Navigator.pushNamed(context, MainNavigator.routeName);
                  },
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey.shade400,
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or Continue With',
                        style: Theme.of(context).textTheme.titleMedium?.apply(
                            color: Colors.grey.shade700, fontSizeFactor: .7),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey.shade400,
                    )),
                  ],
                ),
                const SizedBox(height: 30),
                const SquireTile(imgUrl: 'assets/images/google.png'),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have account?',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const SizedBox(width: 4),

                    //signup
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RegistrationPageScreen.routeName,
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    //signup end
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _loginAuth() async {
    if (_loginFormKey.currentState!.validate()) {
      EasyLoading.show(status: 'Please wait', dismissOnTap: false);
      try {
        userProvider.fetchAndSetUser().then((value) {
          userProvider.userCheckList.forEach((element) {
            print(element.email);
            print(element.password);
            if (element.email == emailController.text &&
                element.password == passwordController.text) {
              foundUser = true;
              userProvider.currentUser = element;
              EasyLoading.dismiss();
              if (mounted) {
                Navigator.pushReplacementNamed(
                    context, MainNavigator.routeName);
              }
            }
          });
          if (foundUser == false) {
            EasyLoading.dismiss();
            setState(() {
              _errMsg = 'Wrong email or wrong password';
            });
          }
        });
      } catch (error) {
        EasyLoading.dismiss();
        setState(() {
          _errMsg = error.toString();
        });
      }
    }
  }
}
