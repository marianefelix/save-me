import 'package:app/ui/pages/home/home.dart';
import 'package:app/ui/utils/custom_colors.dart';
import 'package:app/ui/utils/form/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LinkAction extends StatelessWidget {
  const LinkAction({ 
    Key? key, 
    required this.save, 
    required this.error, 
    required this.delete, 
    this.onBack, 
    this.onConfirm,
  }) : super(key: key);


  final bool save;
  final bool error;
  final bool delete;
  final void Function()? onBack;
  final void Function()? onConfirm;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: save
                ? const Text("Link salvo\n com sucesso!",
                    style: TextStyle(
                      fontSize: 40,
                      color: CustomColors.grey,
                    ),
                    textAlign: TextAlign.center)
                : error
                    ? const Text(
                        "Erro ao salvar o link, tente novamente.",
                        style: TextStyle(
                          fontSize: 40,
                          color: CustomColors.grey,
                        ),
                        textAlign: TextAlign.center)
                    : delete
                        ? const Text(
                            "Tem certeza que\ndeseja excluir esse\n link?",
                            style: TextStyle(
                              fontSize: 30,
                              color: CustomColors.grey,
                            ),
                            textAlign: TextAlign.center)
                        : const Text("Algo deu errado"),
          ),
          const SizedBox(height: 50,),
          save
              ? SvgPicture.asset(
                  'assets/images/check-circle.svg',
                  fit: BoxFit.contain,
                  height: 60,
                )
              : delete
                  ? SvgPicture.asset(
                      'assets/images/help.svg',
                      fit: BoxFit.contain,
                      height: 60,
                    )
                  : error
                      ? SvgPicture.asset(
                          'assets/images/alert-circle.svg',
                          fit: BoxFit.contain,
                        )
                      : const Text("Algo deu errado"),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: delete
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
                          isLoading: false,
                          label: "Confirmar",
                          backgroundColor: CustomColors.purple,
                          textColor: CustomColors.white,
                          width:
                              MediaQuery.of(context).size.width * 0.30,
                          verticalPadding: 13.0,
                          onPressed: onConfirm,
                        )),
                    ],
                  )
                : PrimaryButton(
                    isLoading: false,
                    label: save ? "Fechar" : "Voltar",
                    backgroundColor: CustomColors.purple[100],
                    textColor: CustomColors.purple,
                    width: MediaQuery.of(context).size.width * 0.30,
                    verticalPadding: 13.0,
                    onPressed: () {
                      save 
                        ? Navigator.pushReplacement(context, 
                            MaterialPageRoute(
                              builder: (context) => const Home()
                            )
                          )
                        : onBack != null
                        ? onBack!()
                        : null;
                    },
                  ),
          )
        ],
      ),
    );
  }
}
