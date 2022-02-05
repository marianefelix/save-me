import 'package:app/controllers/profile.controller.dart';
import 'package:app/storage/user_storage.dart';
import 'package:app/stores/AppStore/app_store.dart';
import 'package:app/ui/pages/login/login.dart';
import 'package:app/ui/utils/custom_colors.dart';
import 'package:app/ui/utils/snack_bar.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _profileController = ProfileController();

  Map<String, int> userStatistics = {
    "links": 0,
    "favorites": 0,
    "categories": 0
  };

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchStatistics();
  }

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
                    child: Text(
                      appStore.user.name[0],
                      style: const TextStyle(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        getUserName(),
                        style: TextStyle(
                          fontSize: 30,
                          color: CustomColors.grey[500],
                          fontWeight: FontWeight.bold
                        ),
                      ),

                      Row(
                        children: [
                          Text(
                            appStore.user.email,
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
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: CustomColors.purple,
                          ),
                        )
                      : Text(
                          userStatistics["links"].toString(),
                          style: const TextStyle(
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
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: CustomColors.purple,
                          ),
                        )
                      : Text(
                          userStatistics["categories"].toString(),
                          style: const TextStyle(
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
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: CustomColors.purple,
                          ),
                        )
                      : Text(
                          userStatistics["favorites"].toString(),
                          style: const TextStyle(
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
                logout();
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

  void logout() async {
    await UserStorage.setToken('');

    Navigator.pushReplacement(context, 
      MaterialPageRoute(
        builder: (context) => const Login()
      )
    );
  }

  String getUserName() {
    final userName = appStore.user.name.split(' ');

    if (userName.length > 1) {
      return userName[0] + '\n' + userName[1];
    }

    return appStore.user.name;
  }

  void fetchStatistics() async {
    try {
      final categoriesLength = await _profileController.fetchCategoriesLength();
      final linksLength = await _profileController.fetchLinksLength();
      final favoritesLength = await _profileController.fetchFavoriteLinksLength();

      setState(() {
        userStatistics = {
          "links": linksLength,
          "categories": categoriesLength,
          "favorites": favoritesLength
        };
      });
    } catch(error) {
      CustomSnackBar.show(context, "Erro ao recuperar dados do usuário");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

}
