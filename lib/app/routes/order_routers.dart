import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/modules/order/finished/finished_page.dart';

class OrderRouters {
  OrderRouters._();

  static final routers = <GetPage>[
    GetPage(name: '/orders/finished', page: () => FinishedPage())
  ];
}