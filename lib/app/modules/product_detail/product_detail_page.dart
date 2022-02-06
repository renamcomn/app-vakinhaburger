import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/formatter_helper.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_button.dart';
import './product_detail_controller.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
    
    const ProductDetailPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: VakinhaAppbar(),
            body: LayoutBuilder(
              builder: ((context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                      minWidth: constraints.maxWidth
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: context.width,
                          height: context.heightTransformer(reducedBy: 60),
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage('https://emc.acidadeon.com/dbimagens/lanches_como_790x505_06032018153232.jpg'),
                            fit: BoxFit.cover
                            )
                          ),
                        ),
                        const SizedBox(
                           height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text('X-TUDO', style: context.textTheme.headline4!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold
                          ),),
                        ),
                        const SizedBox(
                           height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('Pão, Presunto, muçarela e orégano'),
                        ),
                        const SizedBox(
                           height: 20,
                        ),
                        Text('componente de botao'),
                        Divider(),
                        ListTile(
                          title: Text('Total', style: VakinhaUI.textbold,),
                          trailing: Text(FormatterHelper.formatCurrency(200.0), style: VakinhaUI.textbold,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: VakinhaButton(onPressed: () {}, label: 'ADICIONAR', width: context.width,),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
        );
    }
}