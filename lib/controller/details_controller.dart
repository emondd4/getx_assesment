import 'package:get/get.dart';
import 'package:getx_assesment/models/ProductListBaseResponse.dart';

class DetailsController extends GetxController {

  late Products product;

  @override
  void onInit() {
    super.onInit();
    product = Get.arguments as Products;
  }

}