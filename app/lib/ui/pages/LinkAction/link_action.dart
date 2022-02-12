import 'package:app/ui/pages/LinkAction/components/text.dart';
import 'package:app/ui/utils/custom_colors.dart';
import 'package:app/ui/utils/form/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LinkAction extends StatelessWidget {
  const LinkAction({ 
    Key? key, 
    required this.save,
    required this.edit,
    required this.error, 
    required this.delete, 
    this.onBack, 
    this.onConfirm, 
    this.onClose,
  }) : super(key: key);


  final bool save;
  final bool edit;
  final bool error;
  final bool delete;
  final void Function()? onBack;
  final void Function()? onClose;
  final void Function()? onConfirm;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: save || edit
                ? const CustomText(text: "Link salvo com sucesso!")
                : error
                ? const CustomText(
                    text: "Erro ao salvar link, tente novamente."
                  )
                : delete
                    ? const CustomText(
                        text: "Tem certeza que deseja excluir esse link?"
                      )
                    : const CustomText(text: "Algo deu errado"),
          ),

          const SizedBox(height: 30),

          save || edit
            ? SvgPicture.asset(
                'assets/images/check-circle.svg',
                fit: BoxFit.contain,
              )
            : delete
            ? SvgPicture.asset(
                'assets/images/help.svg',
                fit: BoxFit.contain,
              )
            : error
            ? SvgPicture.asset(
                'assets/images/alert-circle.svg',
                fit: BoxFit.contain,
              )
            : const Text("Algo deu errado"),

          const SizedBox(height: 50),

          delete
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Cancelar",
                        style: TextStyle(
                          color: CustomColors.purple,
                          fontWeight: FontWeight.w500,
                        )
                      ),
                      style: ButtonStyle(
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
                            left: 30,
                            right: 30,
                            top: 15,
                            bottom: 15
                          );
                        }),
                        elevation: MaterialStateProperty.resolveWith<double>((_) {
                          return 0;
                        }),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: PrimaryButton(
                      isLoading: false,
                      label: "Confirmar",
                      width: MediaQuery.of(context).size.width * 0.30,
                      verticalPadding: 13.0,
                      onPressed: () {
                        if (onConfirm != null) {
                          onConfirm!();
                        }
                      },
                    ),
                  ),
                ],
              )
            : PrimaryButton(
                isLoading: false,
                label: save || edit ? "Fechar" : "Voltar",
                backgroundColor: CustomColors.purple[50],
                textColor: CustomColors.purple,
                width: MediaQuery.of(context).size.width * 0.25,
                verticalPadding: 13.0,
                elevation: 0,
                onPressed: () {
                  onClose != null
                    ? onClose!()
                    : onBack != null
                    ? onBack!()
                    : null;
                },
              )
        ],
      ),
    );
  }
}