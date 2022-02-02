import 'package:app/ui/utils/custom_colors.dart';
import 'package:app/ui/utils/form/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LinkAction extends StatefulWidget {
  const LinkAction(
      {Key? key, required this.save, required this.delete, required this.error})
      : super(key: key);
  final bool save;
  final bool error;
  final bool delete;
  @override
  _LinkActionState createState() => _LinkActionState();
}

class _LinkActionState extends State<LinkAction> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      padding: const EdgeInsets.only(top: 20.0, left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            children: <Widget>[
              const Spacer(),
              IconButton(
                icon: Icon(Icons.close, color: Colors.grey[500], size: 25),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: widget.save
                      ? const Text("Link salvo\n com sucesso!",
                          style: TextStyle(
                            fontSize: 40,
                            color: CustomColors.grey,
                          ),
                          textAlign: TextAlign.center)
                      : widget.error
                          ? const Text(
                              "Erro ao salvar o link, tente novamente.",
                              style: TextStyle(
                                fontSize: 40,
                                color: CustomColors.grey,
                              ),
                              textAlign: TextAlign.center)
                          : widget.delete
                              ? const Text(
                                  "Tem certeza que\ndeseja excluir esse\n link?",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: CustomColors.grey,
                                  ),
                                  textAlign: TextAlign.center)
                              : const Text("Algo deu errado"),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: widget.save
                        ? SvgPicture.asset(
                            'assets/images/chceck-circle.svg',
                            fit: BoxFit.contain,
                            height: 60,
                          )
                        : widget.delete
                            ? SvgPicture.asset(
                                'assets/images/help.svg',
                                fit: BoxFit.contain,
                                height: 60,
                              )
                            : widget.error
                                ? SvgPicture.asset(
                                    'assets/images/alert-circle.svg',
                                    fit: BoxFit.contain,
                                    height: 60,
                                  )
                                : const Text("Algo deu errado")),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: widget.delete
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: const Text("Cancelar",
                                      style: TextStyle(
                                        color: CustomColors.purple,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  style: ButtonStyle(backgroundColor:
                                      MaterialStateProperty.resolveWith((_) {
                                    return CustomColors.purple[50];
                                  }), side:
                                      MaterialStateProperty.resolveWith((_) {
                                    return const BorderSide(
                                        color: CustomColors.purple, width: 1);
                                  }), shape: MaterialStateProperty.resolveWith<
                                      OutlinedBorder>((_) {
                                    return RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8));
                                  }), padding:
                                      MaterialStateProperty.resolveWith((_) {
                                    return const EdgeInsets.only(
                                        left: 30,
                                        right: 30,
                                        top: 15,
                                        bottom: 15);
                                  })),
                                )),
                            Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: PrimaryButton(
                                  label: "Confirmar",
                                  backgroundColor: CustomColors.purple,
                                  textColor: CustomColors.white,
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  verticalPadding: 13.0,
                                  onPressed: () {},
                                )),
                          ],
                        )
                      : PrimaryButton(
                          label: widget.save ? "Fechar" : "Voltar",
                          backgroundColor: CustomColors.purple[100],
                          textColor: CustomColors.purple,
                          width: MediaQuery.of(context).size.width * 0.30,
                          verticalPadding: 13.0,
                          onPressed: () {},
                        ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
