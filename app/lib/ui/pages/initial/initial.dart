import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Initial extends StatelessWidget {
  const Initial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[     
        SvgPicture.asset(
          'images/background.svg', 
          fit: BoxFit.cover,
          height: double.infinity,
        ),
        
        Column(
          children:  <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50,
                    top: 100
                  ),
                  child:
                    SvgPicture.asset(
                      'images/logo.svg', 
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
                              color: Color(0xff5a56ff), 
                              fontFamily: 'Roboto', 
                              fontWeight: FontWeight.w500, 
                              fontSize: 40
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ', ', 
                                style: TextStyle(
                                  color: Color(0xff393A42), 
                                  fontFamily: 'Roboto', 
                                  fontWeight: FontWeight.w300, 
                                  fontSize: 40
                                ),
                              ),
                              TextSpan(
                                text: 'organize ',
                                style: TextStyle(
                                  color: Color(0xff5a56ff), 
                                  fontFamily: 'Roboto', 
                                  fontWeight: FontWeight.w500, 
                                  fontSize: 40
                                ),
                              ),
                              TextSpan(
                                text: 'e',
                                style: TextStyle(
                                  color: Color(0xff393A42), 
                                  fontFamily: 'Roboto', 
                                  fontWeight: FontWeight.w300, 
                                  fontSize: 40
                                ),
                              ),
                              TextSpan(
                                text: ' compartilhe ',
                                style: TextStyle(
                                  color: Color(0xff5a56ff), 
                                  fontFamily: 'Roboto', 
                                  fontWeight: FontWeight.w500, 
                                  fontSize: 40
                                ),
                              ),
                              TextSpan(
                                text: 'seus links favoritos.',
                                style: TextStyle(
                                  color: Color(0xff393A42), 
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
                      onPressed: () {},
                      child: const Text(
                        "Entre", 
                        style: 
                          TextStyle(
                            color: Color(0xff5a56ff), 
                            fontWeight: FontWeight.w500, 
                            fontSize: 16
                          )
                        ),
                      style:  
                        ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith((_) { 
                            return const Color(0xffeceffd);
                          }),
                          side: MaterialStateProperty.resolveWith((_) {
                            return const BorderSide(
                              color: Color(0xff5a56ff),
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
                          color: Color(0xff393A42), 
                          fontFamily: 'Roboto', 
                          fontWeight: FontWeight.w300, 
                          fontSize: 16
                        ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Cadastre-se', 
                          style: TextStyle(
                            color: Color(0xff393A42), 
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