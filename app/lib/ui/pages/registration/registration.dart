import 'package:app/controllers/registration_controller.dart';
import 'package:app/ui/pages/login/login.dart';
import 'package:app/ui/utils/custom_colors.dart';
import 'package:app/ui/utils/Form/password_field.dart';
import 'package:app/ui/utils/Form/text_field.dart';
import 'package:app/ui/utils/form/primary_button.dart';
import 'package:app/ui/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  final _passwordFocusNode = FocusNode();
  final _passwordConfirmFocusNode = FocusNode();
  final _registrationController = RegistrationController();

  bool _isNameEmpty = true;
  bool _isEmailEmpty = true;
  bool _isPaswordEmpty = true;
  bool _isPasswordConfirmEmpty = true;

  bool _isPaswordFieldFocused = false;
  bool _isPaswordConfirmFocused = false;

  bool _isPasswordHidden = true;
  bool _isPaswordConfirmHidden = true;

  bool _hasNameError = false;
  bool _hasEmailError = false;
  bool _hasPasswordError = false;
  bool _hasPaswordConfirmError = false;

  bool _isLoading = false;

  String _errorMessage = '';
  String _emailErrorMessage = '';
  String _passwordErrorMessage = '';

  @override
  void initState() {
    super.initState();
    _passwordFocusNode.addListener(() {
      setState(() {
        _isPaswordFieldFocused = _passwordFocusNode.hasFocus;
      });
    });

    _passwordConfirmFocusNode.addListener(() {
      setState(() {
        _isPaswordConfirmFocused = _passwordConfirmFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmController = TextEditingController();

    _passwordFocusNode.dispose();

    _isPaswordFieldFocused = false;
    _isPaswordConfirmFocused = false;

    _isNameEmpty = true;
    _isEmailEmpty = true;
    _isPaswordEmpty = true;
    _isPasswordConfirmEmpty = true;

    _isPasswordHidden = true;
    _isPaswordConfirmHidden = true;

    _errorMessage = '';
    _emailErrorMessage = '';
    _passwordErrorMessage = '';

    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 30),
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                fit: BoxFit.contain,
                height: 40,
              ),
            ),
            const SizedBox(height: 35.0),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                "Cadastro",
                style: TextStyle(
                  color: CustomColors.grey,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: CustomTextField(
                controller: nameController,
                inputType: TextInputType.text,
                labelText: "Nome",
                icon: Icons.person_outline_outlined,
                isEmpty: _isNameEmpty,
                hasError: _hasNameError,
                onChanged: (value) {
                  setState(() {
                    _isNameEmpty = value.isEmpty;
                  });
                },
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: CustomTextField(
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
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: PasswordField(
                labelText: "Digite a senha",
                obscureText: _isPasswordHidden,
                controller: passwordController,
                focusNode: _passwordFocusNode,
                hasFocus: _isPaswordFieldFocused,
                isPasswordHidden: _isPasswordHidden,
                isEmpty: _isPaswordEmpty,
                hasError: _hasPasswordError,
                suffixIconOnTap: togglePasswodView,
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
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: PasswordField(
                labelText: "Repita a senha",
                obscureText: _isPaswordConfirmHidden,
                controller: passwordConfirmController,
                focusNode: _passwordConfirmFocusNode,
                hasFocus: _isPaswordConfirmFocused,
                isPasswordHidden: _isPaswordConfirmHidden,
                isEmpty: _isPasswordConfirmEmpty,
                hasError: _hasPaswordConfirmError,
                suffixIconOnTap: togglePasswodCofirmView,
                onTap: () {
                  setState(() {
                    _isPaswordConfirmFocused = true;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    _isPasswordConfirmEmpty = value.isEmpty;
                  });
                },
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: PrimaryButton(
                isLoading: _isLoading,
                label: "Cadastrar",
                onPressed: () {
                  registrationAction();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text(
                  "Voltar",
                  style: TextStyle(
                      color: CustomColors.grey,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                      fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void togglePasswodView() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  void togglePasswodCofirmView() {
    setState(() {
      _isPaswordConfirmHidden = !_isPaswordConfirmHidden;
    });
  }

  bool isFormValid() {
    bool isValid = true;

    if (_isNameEmpty) {
      isValid = false;

      setState(() {
        _hasNameError = true;
      });
    } else {
      setState(() {
        _hasNameError = false;
      });
    }

    if (_isEmailEmpty) {
      isValid = false;

      setState(() {
        _hasEmailError = true;
      });
    } else {
      setState(() {
        _hasEmailError = false;
      });
    }

    if (_isPaswordEmpty) {
      isValid = false;

      setState(() {
        _hasPasswordError = true;
      });
    } else {
      setState(() {
        _hasPasswordError = false;
      });
    }

    if (_isPasswordConfirmEmpty) {
      isValid = false;

      setState(() {
        _hasPaswordConfirmError = true;
      });
    } else {
      setState(() {
        _hasPaswordConfirmError = false;
      });
    }

    if (!isValid) {
      setState(() {
        _errorMessage = 'Preencha todos os campos!';
      });

      return isValid;
    }

    setState(() {
      _errorMessage = '';
    });

    return true;
  }

  bool isEmailFieldValid() {
    String email = emailController.text;
    RegExp pattern = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');

    if (!pattern.hasMatch(email)) {
      setState(() {
        _emailErrorMessage = 'Digite um email válido';
        _hasEmailError = true;
      });

      return false;
    }

    setState(() {
      _emailErrorMessage = '';
      _hasEmailError = false;
    });

    return true;
  }

  bool arePasswordFieldsValid() {
    if (passwordController.text != passwordConfirmController.text) {
      setState(() {
        _passwordErrorMessage = 'As senhas não coincidem!';
        _hasPasswordError = true;
        _hasPaswordConfirmError = true;
      });

      return false;
    }

    setState(() {
      _passwordErrorMessage = '';
    });

    return true;
  }

  void registrationAction() {
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

      return;
    }

    if (!isEmailFieldValid()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_emailErrorMessage),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 15.0),
          action: SnackBarAction(
            textColor: CustomColors.white,
            label: 'Fechar',
            onPressed: () {},
          ),
        ),
      );
    }

    if (!arePasswordFieldsValid()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_passwordErrorMessage),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 15.0),
          action: SnackBarAction(
            textColor: CustomColors.white,
            label: 'Fechar',
            onPressed: () {},
          ),
        ),
      );
    }

    if (isFormValid() && isEmailFieldValid() && arePasswordFieldsValid()) {
      createUser();
    }
  }

  createUser() async {
    final params = {
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text
    };
    
    try {
      setState(() {
        _isLoading = true;
      });

      await _registrationController.createUser(params);
    
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Login()));

      CustomSnackBar.show(
        context, 
        "Usuário cadastrado com sucesso!"
      );
    } catch(error) {
      CustomSnackBar.show(
        context, 
        "Falha ao cadastrar usuário. Tente novamente!"
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
