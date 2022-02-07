import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/formatter_helper.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/plus_minus_box.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_button.dart';
import 'package:validatorless/validatorless.dart';
import './shopping_cart_controller.dart';

class ShoppingCartPage extends GetView<ShoppingCartController> {

  final _formKey = GlobalKey<FormState>();

  ShoppingCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constrains) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: constrains.maxHeight,
                  minWidth: constrains.maxWidth),
              child: IntrinsicHeight(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Visibility(
                      visible: controller.products.isNotEmpty,
                      replacement: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Carrinho',
                          style: context.textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.theme.primaryColorDark)),
                              const SizedBox(
                                  height: 10,
                              ),
                          Text('Seu carrinho está vazio')
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Carrinho',
                                  style: context.textTheme.headline6?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: context.theme.primaryColorDark)),
                              IconButton(
                                  onPressed: controller.clear,
                                  icon: Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Obx(() {
                            return Column(
                                children: controller.products
                                    .map((p) => Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: PlusMinusBox(
                                            label: p.product.name,
                                            calculateTotal: true,
                                            elevated: true,
                                            backgroundColor: Colors.white,
                                            quantity: p.quantity,
                                            price: p.product.price,
                                            minusCallback: () {
                                              controller
                                                  .subtractQuantityInProduct(p);
                                            },
                                            plusCallback: () {
                                              controller.addQuantityInProduct(p);
                                            })))
                                    .toList());
                          }),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total do pedido',
                                  style: context.textTheme.bodyText1
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                              Obx(() {
                                return Text(
                                  FormatterHelper.formatCurrency(
                                      controller.totalValue),
                                  style: context.textTheme.bodyText1
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                );
                              })
                            ],
                          ),
                          Divider(),
                          _AddressField(),
                          _CpfField(),
                          Spacer(),
                          VakinhaButton(
                              onPressed: () {
                                final formValid = _formKey.currentState?.validate() ?? false;
                                if(formValid) {
                                  controller.createOrder();
                                }
                              },
                              label: 'FINALIZAR',
                              width: context.width)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AddressField extends GetView<ShoppingCartController> {
  const _AddressField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 35,
          child: Text(
            'Endereço de entrega',
            style: TextStyle(fontSize: 18),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (value) {
            controller.address = value;
          },
          validator: Validatorless.required('Endereço Obrigatório'),
          decoration: InputDecoration(
              hintText: 'Digite o endereço',
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey))),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class _CpfField extends GetView<ShoppingCartController> {
  const _CpfField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 35,
          child: Text(
            'CPF',
            style: TextStyle(fontSize: 18),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (value) {
            controller.cpf = value;
          },
          validator: Validatorless.multiple([
            Validatorless.required('CPF Obrigatório'),
            Validatorless.cpf('CPF Inválido')
          ]),
          decoration: InputDecoration(
              hintText: 'Digite o CPF',
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey))),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
