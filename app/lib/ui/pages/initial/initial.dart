import 'package:app/ui/pages/login/login.dart';
import 'package:app/ui/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/ui/utils/background.dart';

class Initial extends StatelessWidget {
  const Initial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50,
                    top: 100
                  ),
                  child:
                    SvgPicture.asset(
                      'assets/images/logo.svg', 
                      fit: BoxFit.contain,
                      height: 40,
                    ),
                ),
              ],
            ),

            Row(
              children: <Widget>[
                Expanded(
                  child:
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 50, 
                        right: 50, 
                        top: 50
                      ),
                      child:
                        RichText(
                          text: const TextSpan(
                            text: 'Salve',
                            style: TextStyle(
                              color: CustomColors.purple,
                              fontFamily: 'Roboto', 
                              fontWeight: FontWeight.w500, 
                              fontSize: 40
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ', ', 
                                style: TextStyle(
                                  color: CustomColors.grey, 
                                  fontFamily: 'Roboto', 
                                  fontWeight: FontWeight.w300, 
                                  fontSize: 40
                                ),
                              ),
                              TextSpan(
                                text: 'organize ',
                                style: TextStyle(
                                  color: CustomColors.purple, 
                                  fontFamily: 'Roboto', 
                                  fontWeight: FontWeight.w500, 
                                  fontSize: 40
                                ),
                              ),
                              TextSpan(
                                text: 'e',
                                style: TextStyle(
                                  color: CustomColors.grey,
                                  fontFamily: 'Roboto', 
                                  fontWeight: FontWeight.w300, 
                                  fontSize: 40
                                ),
                              ),
                              TextSpan(
                                text: ' compartilhe ',
                                style: TextStyle(
                                  color: CustomColors.purple, 
                                  fontFamily: 'Roboto', 
                                  fontWeight: FontWeight.w500, 
                                  fontSize: 40
                                ),
                              ),
                              TextSpan(
                                text: 'seus links favoritos.',
                                style: TextStyle(
                                  color: CustomColors.grey, 
                                  fontFamily: 'Roboto', 
                                  fontWeight: FontWeight.w300, 
                                  fontSize: 40
                                ),
                              ),
                            ],
                          ),
                        )
                    )
                ), 
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: 
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Login()));
                      },
                      child: const Text(
                        "Entre", 
                        style: 
                          TextStyle(
                            color: CustomColors.purple,
                            fontWeight: FontWeight.w500, 
                            fontSize: 16
                          )
                        ),
                      style:  
                        ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith((_) { 
                            return CustomColors.purple[50];
                          }),
                          side: MaterialStateProperty.resolveWith((_) {
                            return const BorderSide(
                              color: CustomColors.purple,
                              width: 1
                            );
                          }),
                          shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
                            return RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                            );
                          }),
                          padding: MaterialStateProperty.resolveWith((_) {
                            return const EdgeInsets.only(
                              left: 65, 
                              right: 65, 
                              top: 15, 
                              bottom: 15
                            );
                          })
                      ),
                    ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: () {},
                  child: RichText(
                    text: const TextSpan(
                      text: 'ou ',
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
            )
          ],
        )
      ],
    );
  }
}