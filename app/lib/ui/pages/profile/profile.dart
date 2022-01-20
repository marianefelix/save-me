import 'package:app/ui/pages/login/login.dart';
import 'package:app/ui/utils/ScaffoldBase/scaffold_base.dart';
import 'package:app/ui/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, left: 10),
                  child: BackButton(
                      color: Colors.black87,
                      onPressed: () => {Navigator.pop(context)}),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                        alignment: Alignment.center,
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60.0),
                          color: CustomColors.purple,
                        ),
                        child: Text(
                          'M',
                          style: TextStyle(fontSize: 60, color: Colors.white),
                        ))),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: CustomColors.purple.shade200,
                    ),
                    height: 140,
                    width: 330,
                    child: Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mariane',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Felix',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  'mari@email.com.br',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: CustomColors.grey.shade300),
                                )
                              ],
                            ))
                      ],
                    ),
                  ))
            ]),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.link_outlined,
                            color: CustomColors.purple,
                            size: 30.0,
                          ),
                          Text(' 101 ',
                              style: TextStyle(
                                  color: CustomColors.purple,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                          Text(' Links Salvos ',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500))
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.folder_outlined,
                            color: CustomColors.purple,
                            size: 30.0,
                          ),
                          Text(' 10 ',
                              style: TextStyle(
                                  color: CustomColors.purple,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                          Text(' Categorias Criadas ',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500))
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_outlined,
                            color: CustomColors.purple,
                            size: 30.0,
                          ),
                          Text(' 25 ',
                              style: TextStyle(
                                  color: CustomColors.purple,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                          Text(' Links favoritados ',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50, top: 30),
                  child: Row(children: [
                    IconButton(
                      icon: Icon(Icons.logout_outlined),
                      color: CustomColors.purple,
                      onPressed: () => {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()))
                      },
                    ),
                    Text(' Sair')
                  ]),
                )
              ],
            )
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
