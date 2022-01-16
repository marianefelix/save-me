import 'package:app/ui/pages/home/home.dart';
import 'package:app/ui/pages/register/registration.dart';
import 'package:app/ui/utils/custom_colors.dart';
import 'package:app/ui/utils/form/password_field.dart';
import 'package:app/ui/utils/form/primary_button.dart';
import 'package:app/ui/utils/form/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/ui/utils/background.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController(); 

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  bool _isEmailEmpty = true;
  bool _isPaswordEmpty = true;
  bool _isPaswordFieldFocused = false;
  bool _isPasswordHidden = true;
  String _errorMessage = '';
  bool _hasEmailError = false;
  bool _hasPasswordError = false;


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _passwordFocusNode.addListener(() {
      setState(() {
        _isPaswordFieldFocused = _passwordFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    clearState();
  }

  void clearState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();

    _isEmailEmpty = true;

    _isPaswordFieldFocused = false;
    _isPaswordEmpty = true;
    _isPasswordHidden = true;

    _errorMessage = '';
    _hasEmailError = false;
    _hasPasswordError = false;
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 165.0),
              child: SvgPicture.asset(
                'assets/images/logo_2.svg', 
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),

        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),

                  CustomTextField(
                    controller: emailController,
                    inputType: TextInputType.emailAddress,
                    labelText: "Email",
                    hintText: "nome@exemplo.com",
                    icon: Icons.email_outlined, 
                    isEmpty: _isEmailEmpty,
                    hasError: _hasEmailError,
                    onChanged: (value) {
                      setState(() {
                        _isEmailEmpty = value.isEmpty;
                      });
                    },
                  ),

                  const SizedBox(height: 15),

                  PasswordField(
                    labelText: "Senha",
                    obscureText: _isPasswordHidden,
                    controller: passwordController,
                    focusNode: _passwordFocusNode,
                    hasFocus: _isPaswordFieldFocused,
                    isPasswordHidden: _isPasswordHidden,
                    isEmpty: _isPaswordEmpty,
                    suffixIconOnTap: togglePasswodView,
                    hasError: _hasPasswordError,
                    onTap: () {
                      setState(() {
                        _isPaswordFieldFocused = true;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        _isPaswordEmpty = value.isEmpty;
                      });
                    },
                  ),

                  const SizedBox(height: 30),

                  PrimaryButton(
                    label: "Entrar",
                    onPressed: loginAction,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Registration()));
                        },
                        child: RichText(
                          text: const TextSpan(
                            text: 'Não tem uma conta? ',
                            style: 
                              TextStyle(
                                color: CustomColors.grey, 
                                fontFamily: 'Roboto', 
                                fontWeight: FontWeight.w300, 
                                fontSize: 14
                              ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Cadastre-se', 
                                style: TextStyle(
                                  color: CustomColors.grey, 
                                  fontFamily: 'Roboto', 
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void togglePasswodView() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  void loginAction() {
    FocusScope.of(context).unfocus();
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    if (!isFormValid()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_errorMessage),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 15.0),
          action: SnackBarAction(
            textColor: CustomColors.white,
            label: 'Fechar',
            onPressed: () {},
          ),
        ),
      );
    } else {
      Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => const Home()));
    }
  }

  bool isFormValid() {
    if (_isEmailEmpty && _isPaswordEmpty) {
      setState(() {
        _errorMessage = 'Digite seu email e senha!';
        _hasEmailError = true;
        _hasPasswordError = true;
      });

      return false;
    }

    setState(() {
      _errorMessage = '';
    });

    if (_isEmailEmpty) {
      setState(() {
        _errorMessage = 'Digite seu email!';
        _hasEmailError = true;
      });

      return false;
    }

    setState(() {
      _hasEmailError = false;
    });

    if (_isPaswordEmpty) {
      setState(() {
        _errorMessage = 'Digite sua senha!';
        _hasPasswordError = true;
      });

      return false;
    }

    setState(() {
      _hasPasswordError = false;
    });

    return true;
  }
}