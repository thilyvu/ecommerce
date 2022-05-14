import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/screens/checkout/checkout_screen.dart';
import 'package:ecommerce/screens/voucher/voucher_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class OrderSummary extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          thickness: 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SUBTOTAL',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                    Cart.subTotal(controller.carts.value).toString(),
                    style: Theme.of(context).textTheme.headline5,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'DELIVERY FEE',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                    Cart.deliveryFee().toString(),
                    style: Theme.of(context).textTheme.headline5,
                  )
                ],
              ),
              const Divider(
                color: Colors.grey,
                height: 20,
              ),
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F6F9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.receipt)),
                  Spacer(),
                  TextButton(
                    child: Text(
                        controller.choseVoucher.value.id != null
                            ? controller.choseVoucher.value.name!
                            : "Add voucher code",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    onPressed: () {
                      Get.to(() => VoucherPage());
                    },
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Colors.black,
                  )
                ],
              ),
              if (controller.choseVoucher.value.id != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      "-" +
                          controller.choseVoucher.value.discount.toString() +
                          ".0",
                      style: Theme.of(context).textTheme.headline5,
                    )
                  ],
                ),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(5.0),
              height: 50,
              decoration: const BoxDecoration(color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TOTAL',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        Cart.total(controller.carts.value,
                                controller.choseVoucher.value)
                            .toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      )
                    ]),
              ),
            )
          ],
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.black),
            onPressed: () {
              Get.to(() => CheckOutScreen());
            },
            child: Text(
              'GO TO CHECKOUT',
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Colors.white),
            ))
      ],
    );
  }
}
