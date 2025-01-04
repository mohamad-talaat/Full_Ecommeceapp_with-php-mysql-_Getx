import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/data/linkApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItemsCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String image;
  final void Function() onAdd;
  final void Function() onRemove;
  const CustomItemsCartList({
    super.key,
    required this.name,
    required this.price,
    required this.count,
    required this.image,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    return Card(
      child: Container(
        child: Row(children: [
          Expanded(
              flex: 2,
              child: CachedNetworkImage(
                height: 80,
                // imageUrl: '$image ', // not this >> pics are storege on server backend
                imageUrl: '${AppLink.imagestItems}/$image ',
              )),
          Expanded(
              flex: 3,
              child: ListTile(
                title: Text(name, style: const TextStyle(fontSize: 15)),
                subtitle: Text(price,
                    style:
                        const TextStyle(color: AppColor.primaryColor, fontSize: 17)),
              )),
          Expanded(
              child: Column(
            children: [
              SizedBox(
                  height: 35,
                  child: IconButton(onPressed: onAdd, icon: const Icon(Icons.add))),
              SizedBox(
                  height: 30,
                  child: Text(
                    count,
                    style: const TextStyle(fontFamily: "sans"),
                  )),
              SizedBox(
                  height: 25,
                  child:
                      IconButton(onPressed: onRemove, icon: const Icon(Icons.remove)))
            ],
          ))
        ]),
      ),
    );
  }
}
