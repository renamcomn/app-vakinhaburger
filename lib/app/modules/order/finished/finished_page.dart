import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_button.dart';

class FinishedPage extends StatelessWidget {

  const FinishedPage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: CustomScrollView(
             slivers: [
               SliverFillRemaining(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     Spacer(),
                     Image.asset('assets/images/logo_rounded.png', width: context.widthTransformer(reducedBy: 50), height: context.heightTransformer(reducedBy: 70),),
                     const SizedBox(
                        height: 10,
                     ),
                     Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Text('Pedido relizado com sucesso, clique no botão abaixo para acessar o QRCode do Pix.',
                       textAlign: TextAlign.center,
                       style: context.textTheme.headline6?.copyWith(
                         color: context.theme.primaryColorDark,
                         fontWeight: FontWeight.bold,
                       ),
                       ),
                     ),
                     const SizedBox(
                        height: 20,
                     ),
                     SizedBox(
                      width: context.widthTransformer(reducedBy: 30),
                      child: VakinhaButton(
                        color: context.theme.primaryColorDark,
                        onPressed: () {
                          
                        }, label: 'PIX',
                      )
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: context.widthTransformer(reducedBy: 10),
                      child: VakinhaButton(
                        onPressed: () {}, label: 'Fechar',
                      )
                    ),
                   ],
                 ),
               )
             ],
           ),
       );
  }
}