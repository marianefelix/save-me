import 'package:app/ui/utils/custom_colors.dart';
import 'package:flutter/material.dart';
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

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();


  final _formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
              child:  SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/images/logo_2.svg', 
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          focusNode: emailFocusNode,
                          style: const TextStyle(color: Colors.black),
                          cursorColor: CustomColors.purple,
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: const TextStyle(fontSize: 14),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, 
                                color: CustomColors.grey[200]!
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 1, color: CustomColors.purple),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            prefixIcon: Icon(Icons.email_outlined, color: emailFocusNode.hasFocus ? CustomColors.purple : CustomColors.grey[300]),
                            filled: true,
                            fillColor: CustomColors.grey[50],
                          )
                        ),
                      ),
                    
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          style: const TextStyle(color: Colors.black),
                          cursorColor: CustomColors.purple,
                          decoration: InputDecoration( 
                            labelText: "Senha",
                            labelStyle: const TextStyle(fontSize: 14),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, 
                                color: passwordController.text != '' 
                                  ? CustomColors.purple 
                                  : CustomColors.grey[200]!
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 1, color: CustomColors.purple),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            prefixIcon: const Icon(Icons.lock_outline),
                            filled: true,
                            fillColor: CustomColors.grey[50],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "Entrar",
                            style: 
                            TextStyle(
                              color: CustomColors.white,
                              fontWeight: FontWeight.w500, 
                              fontSize: 16
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith((_) { 
                              return CustomColors.purple;
                            }),
                            minimumSize: MaterialStateProperty.resolveWith((_) { 
                              return const Size.fromHeight(60);
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
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
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
                          )
                        ],
                      ),
                    ],
                  )
                )
              ),
            ),
          ],
        ),
      ],
    );
  }
}