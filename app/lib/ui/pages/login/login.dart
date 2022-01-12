import 'package:app/ui/utils/custom_colors.dart';
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
  bool _isHiddenPassword = true;



  final _formKey = GlobalKey<FormState>();


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
    _isHiddenPassword = true;
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

                  TextFormField(
                    controller: emailController,
                    focusNode: _emailFocusNode,
                    onTap: () {
                      setState(() {
                        _isEmailFieldFocused = true;
                        _isPaswordFieldFocused = false;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        _isEmailEmpty = value.isEmpty;
                      });
                    },
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: CustomColors.purple,
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "nome@exemplo.com",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: _isEmailEmpty
                            ? CustomColors.grey[200]!
                            : CustomColors.purple
                        ),
                      ), 
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: _isEmailFieldFocused || !_isEmailEmpty 
                          ? CustomColors.purple 
                          : CustomColors.grey[300]
                      )
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextFormField(
                    obscureText: _isHiddenPassword,
                    controller: passwordController,
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
                    focusNode: _passwordFocusNode,
                    cursorColor: CustomColors.purple,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: _isPaswordEmpty
                            ? CustomColors.grey[200]!
                            : CustomColors.purple
                        ),
                      ), 
                      prefixIcon: Icon(
                        Icons.lock_outline, 
                        color:  _isPaswordFieldFocused || !_isPaswordEmpty 
                          ? CustomColors.purple 
                          : CustomColors.grey[300]
                      ),
                      suffixIcon: _isPaswordFieldFocused && !_isPaswordEmpty 
                        ? GestureDetector(
                          onTap: () {
                            togglePasswodView();
                          },
                          child: Icon(
                            _isHiddenPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                            color: CustomColors.grey[300]
                          ),
                        )
                      : null
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 18.0),
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                            color: CustomColors.white,
                            fontWeight: FontWeight.w500, 
                            fontSize: 16
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((_) { 
                          return CustomColors.purple;
                        }),
                        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
                          return RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                          );
                        }),
                      ),
                    ),
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
      _isHiddenPassword = !_isHiddenPassword;
    });
  }

}