//import 'package:app/ui/pages/home/components/EmptyState/empty_state.dart';
import 'package:app/ui/utils/ScaffoldBase/scaffold_base.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var isEmpty = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      searchController: searchController,
      bodyChild: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 35, right: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(height: 35),
            //Header(),
            //EmptyState()
          ],
        ),
      ),
    );
  }
}