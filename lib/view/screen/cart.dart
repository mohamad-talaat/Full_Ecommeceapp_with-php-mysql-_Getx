import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/view/widget/cart/custom_bottom_navgationbar_cart.dart';
import 'package:e_commerce_app/view/widget/cart/customitemscartlist.dart';
import 'package:e_commerce_app/view/widget/cart/topcardCart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/handlingdata/handlingdataview.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
        appBar: AppBar(title: const Text("My Cart")),
        bottomNavigationBar: GetBuilder<CartController>(
            builder: (controller) => BottomNavgationBarCart(
                  onApplyCoupon: () {
                    controller.checkcoupon();
                  },
                  controllercoupon: controller.couponcontroller!,
                  price: "${cartController.priceorders}",
                  shipping: "300",
                  totalprice: "${controller.getTotalPrice()}",
                  discount: '${controller.discountcoupon}',
                )),
        body: GetBuilder<CartController>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    const SizedBox(height: 10),
                    //     Text("You Have ${cartController.totalcountitems} Items in Your List")                    ,
                    TopCardCart(
                        message:
                            "You Have ${cartController.totalcountitems} Items in Your List"),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ...List.generate(
                            cartController.data.length,
                            (index) => CustomItemsCartList(
                              onAdd: () async {
                                await cartController.add(cartController
                                    .data[index].itemsId
                                    .toString());
                                cartController.refreshPage();
                              },
                              onRemove: () async {
                                await cartController.delete(cartController
                                    .data[index].itemsId
                                    .toString());
                                cartController.refreshPage();
                              },
                              image: "${cartController.data[index].itemsImage}",
                              name: "${cartController.data[index].itemsName}",
                              price:
                                  "${cartController.data[index].itemsprice} \$",
                              count: "${cartController.data[index].countitems}",
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )))));
  }
}
