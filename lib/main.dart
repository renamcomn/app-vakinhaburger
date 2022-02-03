import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burguer_mobile/app/routes/splash_routers.dart';

void main() {
  runApp(const VakinhaBurgerrMainApp());
}


class VakinhaBurgerrMainApp extends StatelessWidget {
  const VakinhaBurgerrMainApp({ Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vakinha Burger',
      theme: VakinhaUI.theme,
      getPages: [
        ...SplashRouters.routers
      ],
    );
  }
}