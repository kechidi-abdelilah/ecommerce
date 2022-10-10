import 'package:badges/badges.dart';
import 'package:ecommerce/core/theme/colors.dart';
import 'package:ecommerce/pages/home/data/shoes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:ecommerce/core/utils/dimesions.dart';
import 'package:ecommerce/network/models/shoe.dart';
import 'package:ecommerce/pages/cart/controllers/cart_controller.dart';
import 'package:ecommerce/pages/home/ui/widgets/my_text.dart';
import 'package:ecommerce/routes/routes.dart';

import '../../../network/models/product_model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height20,
                  horizontal: Dimensions.width30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back),
                    ),
                    MyText(
                      text: 'Details product',
                      size: Dimensions.font20,
                      weight: FontWeight.w500,

                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () => Get.toNamed(Routes.cart),
                      icon: Badge(
                        badgeContent: Obx(
                          () => MyText(
                            text: Get.find<CartController>()
                                .items
                                .length
                                .toString(),
                            color: Colors.white,
                          ),
                        ),
                        child: SvgPicture.asset('assets/icons/Buy.svg'),
                      ),
                      iconSize: Dimensions.iconSize26,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height15,
              ),
              Image.network(
                "${widget.product.image}",
                width: double.infinity,
                height: Dimensions.detailCoverHeight,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.all(Dimensions.height15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: "Rating : ${widget.product.rating!.rate}",
                          size: Dimensions.font24,
                          weight: FontWeight.w500,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        Row(
                          children: [
                            MyText(
                              text:
                                  '\$ ${widget.product.price!.toStringAsFixed(2)}',
                              size: Dimensions.font24,
                              weight: FontWeight.w500,
                            ),
                            SizedBox(
                              width: Dimensions.width5,
                            ),

                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(Dimensions.height15),
                child: const Divider(
                  thickness: 1.1,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.height15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: 'Description of product',
                      size: Dimensions.font20,
                      weight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    MyText(
                      text: "${widget.product.description}",
                      size: Dimensions.font14,
                      lineHeight: 1.5,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 20,
        child: SizedBox(
          height: Dimensions.height100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                width: Dimensions.width60 * 3,
                height: Dimensions.width60,
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(0),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.main),
                  ),
                  onPressed:() =>
                      Get.find<CartController>().addToCart(widget.product),
                  child: const Text(
                    'Add to cart',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                width: Dimensions.width60 * 3,
                height: Dimensions.width60,
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(0),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFFF0F2F1),
                    ),
                  ),
                  onPressed: () {
                   /* Get.find<CartController>().addToCart(widget.shoe);
                    Get.toNamed(Routes.cart);*/
                  },
                  child: const Text(
                    'Buy Now',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
