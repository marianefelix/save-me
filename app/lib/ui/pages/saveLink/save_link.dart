import 'package:app/ui/utils/custom_colors.dart';
import 'package:app/ui/utils/Form/primary_button.dart';
import 'package:app/ui/utils/Form/text_field.dart';
import 'package:flutter/material.dart';

class SaveLink extends StatefulWidget {
  const SaveLink({Key? key}) : super(key: key);

  @override
  _SaveLinkState createState() => _SaveLinkState();
}

class _SaveLinkState extends State<SaveLink> {
  TextEditingController titleController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  bool _isTitleEmpty = true;
  bool _isLinkEmpty = true;
  bool _isCategoryEmpty = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    titleController = TextEditingController();
    linkController = TextEditingController();
    categoryController = TextEditingController();

    _isTitleEmpty = true;
    _isLinkEmpty = true;
    _isCategoryEmpty = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      padding: const EdgeInsets.only(top: 20.0, left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('Salvar link',
                  style: TextStyle(
                      color: CustomColors.grey[500],
                      fontSize: 25,
                      fontWeight: FontWeight.w500)),
              const Spacer(),
              IconButton(
                icon: Icon(Icons.close, color: Colors.grey[500], size: 25),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text("Título:",
              style: TextStyle(
                color: CustomColors.grey[500],
                fontSize: 15,
                fontWeight: FontWeight.w500,
              )),
          const SizedBox(height: 8),
          SizedBox(
              height: 50,
              child: CustomTextField(
                controller: titleController,
                contentPadding: EdgeInsets.zero,
                icon: Icons.title_outlined,
                labelText: "Digite o titulo",
                isEmpty: _isTitleEmpty,
                hasError: false,
                onChanged: (value) {
                  setState(() {
                    _isTitleEmpty = value.isEmpty;
                  });
                },
              )),
          const SizedBox(height: 15),
          Text("Link:",
              style: TextStyle(
                color: CustomColors.grey[500],
                fontSize: 15,
                fontWeight: FontWeight.w500,
              )),
          const SizedBox(height: 8),
          SizedBox(
              height: 50,
              child: CustomTextField(
                  controller: linkController,
                  icon: Icons.link_outlined,
                  contentPadding: EdgeInsets.zero,
                  labelText: "http://link@example.com",
                  isEmpty: _isLinkEmpty,
                  hasError: false,
                  onChanged: (value) {
                    setState(() {
                      _isLinkEmpty = value.isEmpty;
                    });
                  })),
          const SizedBox(height: 15),
          Text("Categoria:",
              style: TextStyle(
                color: CustomColors.grey[500],
                fontSize: 15,
                fontWeight: FontWeight.w500,
              )),
          const SizedBox(height: 8),
          SizedBox(
            height: 50,
            child: CustomTextField(
                controller: categoryController,
                contentPadding: EdgeInsets.zero,
                icon: Icons.search_outlined,
                labelText: "Digite a categoria",
                isEmpty: _isCategoryEmpty,
                hasError: false,
                onChanged: (value) {
                  setState(() {
                    _isCategoryEmpty = value.isEmpty;
                  });
                }),
          ),
          const SizedBox(height: 50),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Align(
                alignment: Alignment.bottomRight,
                child: PrimaryButton(
                  label: "Confirmar",
                  backgroundColor: _isLinkEmpty
                      ? CustomColors.grey[100]
                      : CustomColors.purple,
                  textColor: _isLinkEmpty
                      ? CustomColors.grey[300]
                      : CustomColors.white,
                  width: MediaQuery.of(context).size.width * 0.30,
                  verticalPadding: 13.0,
                  onPressed: _isLinkEmpty ? null : () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
