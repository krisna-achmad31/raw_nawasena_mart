import 'package:flutter/material.dart';
import 'package:nawasena/components/text.dart';
import 'package:nawasena/constant.dart';
import 'package:nawasena/screens/login/provider/login_provider.dart';
import 'package:nawasena/screens/mainPage/main_page_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late bool obsecureText = true;

  final formKey = GlobalKey<FormState>();

  late String email = '';
  late String password = '';

  animatedCount(dynamic myWidget, dynamic loading) {
    return Consumer<LoginProvider>(
      builder: (context, homeScreenProvider, child) {
        if (homeScreenProvider.stateLogin == ResultLoginState.loading) {
          return loading;
        } else if (homeScreenProvider.stateLogin == ResultLoginState.hasData) {
          return myWidget;
        } else if (homeScreenProvider.stateLogin == ResultLoginState.noData) {
          return myWidget;
        } else if (homeScreenProvider.stateLogin == ResultLoginState.error) {
          return myWidget;
        } else {
          return myWidget;
        }
      },
    );
  }

  isLoading(LoginProvider logProv) {
    if (logProv.stateLogin == ResultLoginState.loading) {
      return 70.0;
    } else if (logProv.stateLogin == ResultLoginState.hasData) {
      return 370.0;
    } else if (logProv.stateLogin == ResultLoginState.noData) {
      return 370.0;
    } else if (logProv.stateLogin == ResultLoginState.error) {
      return 370.0;
    } else {
      return 370.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: LoginProvider(),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/bg_nawasena.png',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 180,
                    ),
                    TextRegularLancelot(
                      label: 'NAWASENA',
                      size: 64,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 68,
                    ),
                    TextRegularExo(
                      label: 'Sign in to Continue',
                      size: 23,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Please fill in your email address and \n password to continue to order.',
                      style: TextStyle(
                        color: Colors.white
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16,),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: Colors.white
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: grayColor,
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: grayColor
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    SizedBox(height: 16,),
                    TextFormField(
                      obscureText: obsecureText,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: Colors.white
                        ),
                        hintText: 'Password',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: grayColor,
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: grayColor
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obsecureText = !obsecureText;
                            });
                          },
                          icon: Icon(
                            (obsecureText == true) ? Icons.visibility_off : Icons.visibility,
                          color: Colors.white,),

                        ),
                      ),
                    ),
                    Spacer(),
                    Consumer<LoginProvider>(
                      builder: (context, homeScreenProvider, child) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.fastOutSlowIn,
                          height: 52,
                          width: double.infinity,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.transparent),
                          child: ElevatedButton(
                            onPressed: () async {
                              Navigator.pushReplacementNamed(context, MainPageScreen.routeName);
                              if (formKey.currentState!.validate()) {
                                var prov = Provider.of<LoginProvider>(context, listen: false);
                                // await prov.login(email: email, password: password);
                                if (!mounted) return;

                                // if (prov.isLogin == true) {
                                //   if (homeScreenProvider.messageLogin == 'login_success') {
                                //     Utils.showMySnackBar(
                                //       context,
                                //       color: greyColor9E,
                                //       content: Text(
                                //         homeScreenProvider.messageLogin,
                                //       ),
                                //     );
                                //     Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                                //   } else {
                                //     Utils.showMySnackBar(
                                //       context,
                                //       color: redColor51C,
                                //       content: Text(
                                //         homeScreenProvider.messageLogin,
                                //       ),
                                //     );
                                //   }
                                // }
                              }
                            },
                            style: ElevatedButton.styleFrom(primary: secondaryColor),
                            child: animatedCount(
                              const Text(
                                'LOGIN',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const CircularProgressIndicator.adaptive(),
                            ),
                          ),
                        );
                      },
                    ),
                    Spacer()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
