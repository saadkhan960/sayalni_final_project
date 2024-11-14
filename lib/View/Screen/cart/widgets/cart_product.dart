import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saylani_final_project/Controllers/cart_controller.dart';
import 'package:saylani_final_project/Models/cart_model.dart';
import 'package:saylani_final_project/Utils/app_colors.dart';
import 'package:saylani_final_project/Utils/app_sizes.dart';
import 'package:saylani_final_project/View/Global%20Widgets/circle_container.dart';

class CartProduct extends StatefulWidget {
  const CartProduct({
    super.key,
    this.isCheckout = false,
    required this.cartmodel,
    required this.index,
  });
  final bool isCheckout;
  final CartModel cartmodel;
  final int index;

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          if (!widget.isCheckout)
            Transform.scale(
              scale: 1.5,
              child: Checkbox(
                activeColor: AppColors.primary,
                value: true,
                onChanged: (value) {},
              ),
            ),
          Container(
            width: Get.width * 0.2,
            height: Get.height * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.extraborderRadius),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  widget.cartmodel.image,
                ),
              ),
            ),
          ),
          SizedBox(width: Get.width * 0.03),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width * 0.5,
                child: Text(
                  widget.cartmodel.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Text(
                "Color: ${widget.cartmodel.color}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .apply(color: Colors.grey),
              ),
              SizedBox(height: Get.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ ${widget.cartmodel.price}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                      width: !widget.isCheckout
                          ? Get.width * 0.10
                          : Get.width * 0.30),
                  !widget.isCheckout
                      ? Row(
                          children: [
                            InkWell(
                              onTap: () {
                                cartController.decreaseQuantity(
                                    widget.cartmodel.productId);
                              },
                              child: const CircleContainer(
                                radius: 25,
                                child: Center(
                                  child: Text(
                                    "-",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: Get.width * 0.01),
                            Text(
                              widget.cartmodel.quantity.toString(),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            SizedBox(width: Get.width * 0.01),
                            InkWell(
                              onTap: () {
                                cartController.increaseQuantity(
                                    widget.cartmodel.productId);
                              },
                              child: const CircleContainer(
                                radius: 25,
                                child: Center(
                                  child: Text(
                                    "+",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: Get.width * 0.02),
                            InkWell(
                              onTap: () {
                                cartController
                                    .removeFromCart(widget.cartmodel.productId);
                              },
                              child: const CircleContainer(
                                radius: 25,
                                child: Center(
                                  child: Icon(
                                    Icons.delete_outline_rounded,
                                    size: 17,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Text("${widget.cartmodel.quantity.toString()} quantity")
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
