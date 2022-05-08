import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcom/animals/widget/card.dart';
import 'package:petcom/screens/buyer/product_detail.dart';
import 'package:petcom/controllers/cart_controller.dart';
import 'package:petcom/controllers/product_controller.dart';

class BirdItems extends StatelessWidget {
  const BirdItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CartController());
    var controller = Get.put(ProductController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text('Bird Items'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            return ListView.builder(
                itemCount: controller.birdProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  var product = controller.birdProducts[index];
                  return GestureDetector(
                    onTap: () => Get.to(ProductDetailScreen(product: product)),
                    child: ProductCardTile(product: product),
                  );
                });
          }),
        ),
      ),
    );
  }
}
