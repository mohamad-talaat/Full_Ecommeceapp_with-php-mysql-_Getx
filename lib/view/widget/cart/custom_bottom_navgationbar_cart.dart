import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart_controller.dart';
import '../../../core/constant/color.dart';
import 'buttoncart.dart';
import 'custombuttoncoupon.dart';

class BottomNavgationBarCart extends GetView<CartController> {
  final String price;
  final String discount;
  final String shipping;
  final String totalprice;
  final void Function()? onApplyCoupon;

  final TextEditingController? controllercoupon;
  const BottomNavgationBarCart(
      {Key? key,
      required this.price,
      required this.discount,
      required this.shipping,
      required this.totalprice,
      required this.controllercoupon,
      this.onApplyCoupon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GetBuilder<CartController>(
            builder: (controller) => controller.couponname == null
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(children: [
                      Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: controllercoupon,
                            decoration: const InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 10),
                                hintText: "Coupon Code",
                                border: OutlineInputBorder()),
                          )),
                      const SizedBox(width: 5),
                      Expanded(
                          flex: 1,
                          child: CustomButtonCoupon(
                            textbutton: "apply",
                            onPressed: onApplyCoupon,
                          ))
                    ]))
                : Container(
                    child: Text(
                    "Coupon Code ${controller.couponname!}",
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  ))),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.primaryColor, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text("price", style: TextStyle(fontSize: 16))),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$price \$", style: const TextStyle(fontSize: 16)))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text("discount", style: TextStyle(fontSize: 16))),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$discount ", style: const TextStyle(fontSize: 16)))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text("shipping", style: TextStyle(fontSize: 16))),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$shipping ", style: const TextStyle(fontSize: 16)))
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text("Total Price",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor))),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$totalprice \$",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor)))
              ],
            ),
          ]),
        ),
        const SizedBox(height: 10),
        CustomButtonCart(
          textbutton: "Order",
          onPressed: () {
            controller.goToCheckPage();
            //      Get.toNamed(AppRoute.checkout);
          },
        )
      ],
    ));
  }
}
