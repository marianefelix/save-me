import 'package:app/ui/pages/login/login.dart';
import 'package:app/ui/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: SafeArea(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.keyboard_arrow_left_rounded,
                    size: 30,
                    color: CustomColors.grey[500],
                  ),
                  Text(
                    "Perfil",
                    style: TextStyle(
                      color: CustomColors.grey[500],
                      fontSize: 16,
                      fontWeight: FontWeight.normal,    
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 40),

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.0),
                      color: CustomColors.purple,
                    ),
                    child: const Text(
                      'M',
                      style: TextStyle(
                        fontSize: 50, 
                        color: CustomColors.white
                      ),
                    )
                  ),
                ),
              ),

              const SizedBox(height: 40),


              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: CustomColors.purple[200],
                ),
                height: 140,
                width: 330,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Mariane',
                            style: TextStyle(
                              fontSize: 30,
                              color: CustomColors.grey[500],
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Text(
                            'Felix',
                            style: TextStyle(
                              fontSize: 30,
                              color: CustomColors.grey[500],
                              fontWeight: FontWeight.normal
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Text(
                            'mari@email.com.br',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: CustomColors.grey[300]
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: CustomColors.purple),
                      borderRadius: BorderRadius.circular(50),
                      color: CustomColors.white,
                    ),
                    height: 50,
                    width: 50,
                    child: const Icon(
                      Icons.link_outlined,
                      color: CustomColors.purple,
                      size: 30.0,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      "101",
                      style: TextStyle(
                        color: CustomColors.purple,
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ),

                  const Text('links salvos',
                    style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.normal
                    )
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: CustomColors.purple),
                      borderRadius: BorderRadius.circular(50),
                      color: CustomColors.white,
                    ),
                    height: 50,
                    width: 50,
                    child: const Icon(
                      Icons.folder_outlined,
                      color: CustomColors.purple,
                      size: 30.0,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      "10",
                      style: TextStyle(
                        color: CustomColors.purple,
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ),

                  const Text('categorias criadas',
                    style: TextStyle(
                      fontSize: 15, 
                      fontWeight: FontWeight.normal
                    )
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: CustomColors.purple),
                      borderRadius: BorderRadius.circular(50),
                      color: CustomColors.white,
                    ),
                    height: 50,
                    width: 50,
                    child: const Icon(
                      Icons.star_border_outlined,
                      color: CustomColors.purple,
                      size: 30.0,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      "25",
                      style: TextStyle(
                        color: CustomColors.purple,
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ),

                  const Text('links favoritados',
                    style: TextStyle(
                      fontSize: 15, 
                      fontWeight: FontWeight.normal
                    )
                  ),
                ],
              ),

              const SizedBox(height: 100),

              GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, 
                  MaterialPageRoute(
                    builder: (context) => const Login()
                  )
                );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.logout,
                      size: 24,
                      color: CustomColors.grey[500],
                    ),
                  ),
                  Text(
                    "Sair",
                    style: TextStyle(
                      color: CustomColors.grey[500],
                      fontSize: 16,
                      fontWeight: FontWeight.normal,    
                    ),
                  ),
                ],
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
