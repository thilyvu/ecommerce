import 'package:ecommerce/controller/checkout_controller.dart';
import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/models/checkout_model.dart';
import 'package:ecommerce/screens/history/widget/status_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class HistoryWidget extends GetView<CheckoutController> {
  const HistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Obx(
            () => ListView.builder(
                itemCount: controller.checkout.value.length,
                itemBuilder: (BuildContext context, int index) {
                  return OrderCard(controller.checkout.value[index],
                      controller.checkout.value[index].carts!);
                }),
          ))
        ],
      ),
    );
  }
}

class OrderCard extends GetView<CheckoutController> {
  final Checkout checkout;
  final List<Cart> listCarts;
  OrderCard(this.checkout, this.listCarts, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order ID: ${checkout.id}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  StatusChip(status: checkout.status!)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listCarts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.network(
                              listCarts[index].product!.imageUrl!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listCarts[index].product!.name!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text('Delivery Fee',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('${checkout.deliveryFee}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('${checkout.total}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  )
                ],
              ),
              // const SizedBox(
              //   height: 10,
              //   child: Text("Rating"),
              // ),
              // RatingBar.builder(
              //   initialRating: 3,
              //   minRating: 1,
              //   direction: Axis.horizontal,
              //   allowHalfRating: true,
              //   unratedColor: Colors.amber.withAlpha(50),
              //   itemCount: 5,
              //   itemSize: 50.0,
              //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              //   itemBuilder: (context, _) => Icon(
              //     Icons.star,
              //     color: Colors.amber,
              //   ),
              //   onRatingUpdate: (rating) =>
              //       controller.rateOrder(checkout, rating),
              //   updateOnDrag: true,
              // ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
