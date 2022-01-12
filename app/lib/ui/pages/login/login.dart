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
  bool _isEmailFieldFocused = false;
  bool _isPaswordFieldFocused = false;
  bool _isPasswordHidden = true;
  String _errorMessage = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      setState(() {
        _isEmailFieldFocused = _emailFocusNode.hasFocus;
      });
    });

    _passwordFocusNode.addListener(() {
      setState(() {
        _isPaswordFieldFocused = _passwordFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    emailController.dispose();
    passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _isEmailFieldFocused = false;
    _isPaswordFieldFocused = false;
    _isEmailEmpty = true;
    _isPaswordEmpty = true;
    _isPasswordHidden = true;
    super.dispose();
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
                    onChanged: (value) {
                      setState(() {
                        _isEmailEmpty = value.isEmpty;
                      });
                    },
                  ),

                  const SizedBox(height: 15),

                  PasswordField(
                    obscureText: _isPasswordHidden,
                    controller: passwordController,
                    focusNode: _passwordFocusNode,
                    hasFocus: _isPaswordFieldFocused,
                    isPasswordHidden: _isPasswordHidden,
                    isEmpty: _isPaswordEmpty,
                    suffixIconOnTap: togglePasswodView,
                    onTap: () {
                      setState(() {
                        _isEmailFieldFocused = false;
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
                        onPressed: () {},
                        child: RichText(
                          text: const TextSpan(
                            text: 'Não tem uma conta? ',
                            style: 
                              TextStyle(
                                color: CustomColors.grey, 
                                fontFamily: 'Roboto', 
                                fontWeight: FontWeight.w300, 
                                fontSize: 16
                              ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Cadastre-se', 
                                style: TextStyle(
                                  color: CustomColors.grey, 
                                  fontFamily: 'Roboto', 
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
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
    if (!isFormValidate()) {
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_errorMessage),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 15.0),
          //width: 200.0,
          action: SnackBarAction(
            textColor: CustomColors.white,
            label: 'Fechar',
            onPressed: () {},
          ),
        ),
      );
    }
  }

  bool isFormValidate() {
    if (emailController.text.isEmpty && passwordController.text.isEmpty) { 
      setState(() {
        _errorMessage = 'Digite seu email e senha!';
      });

      return false;
    }

    if (emailController.text.isEmpty) { 
      setState(() {
        _errorMessage = 'Digite seu email!';
      });

      return false;
    }

    if (passwordController.text.isEmpty) { 
      setState(() {
        _errorMessage = 'Digite sua senha!';
      });

      return false;
    }

    setState(() {
      _errorMessage = '';
    });

    return true;
  }
}