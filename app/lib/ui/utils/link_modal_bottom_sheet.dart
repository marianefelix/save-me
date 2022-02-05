import 'package:app/ui/pages/LinkAction/link_action.dart';
import 'package:app/ui/utils/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinkModalBottomSheet {
  LinkModalBottomSheet._();

  static void show(BuildContext context, bool save, bool error, bool delete) {
    FocusManager.instance.primaryFocus?.unfocus();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0), 
          topRight: Radius.circular(30.0)
        ),
      ),
      backgroundColor: CustomColors.white,
      builder: (BuildContext bc) {
        return LinkAction(save: save, error: error, delete: delete);
      }
    );
  }
}