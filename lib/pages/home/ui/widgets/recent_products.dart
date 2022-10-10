import 'package:ecommerce/core/theme/colors.dart';
import 'package:ecommerce/core/utils/dimesions.dart';
import 'package:ecommerce/network/models/product_model.dart';
import 'package:ecommerce/network/models/shoe.dart';
import 'package:ecommerce/pages/cart/controllers/cart_controller.dart';
import 'package:ecommerce/pages/detail/ui/index.dart';
import 'package:ecommerce/pages/home/controllers/recent_products_controller.dart';
import 'package:ecommerce/pages/home/data/shoes.dart';
import 'package:ecommerce/pages/home/providers/products_provider.dart';
import 'package:ecommerce/pages/home/ui/widgets/my_text.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RecentProducts extends GetView<RecentProductController> {
  const RecentProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx((data) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  text: 'Recents Products',
                  size: Dimensions.font16,
                  weight: FontWeight.w500,
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/Filter.svg',
                    height: Dimensions.height20,
                    width: Dimensions.width20,
                  ),
                )
              ],
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: Dimensions.cardHeight,
              ),
              itemBuilder: (BuildContext context, int index) {

                return ShoeCard(product: data[index],);
              },
            ),
          ],
        ));
  }
}

class ShoeCard extends StatelessWidget {
  const ShoeCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(
        DetailsPage(product:product ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius8),
            topRight: Radius.circular(Dimensions.radius8),
          ),
        ),
        elevation: .5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius8),
                topRight: Radius.circular(Dimensions.radius8),
              ),
              child: Image.network(
                product.image!,
                height: Dimensions.coverHeight,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.width15, top: Dimensions.height10),
              child: MyText(
                text: product.title!,
                size: 14,
                textOverflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Dimensions.width15,
                top: Dimensions.height5,
                bottom: Dimensions.height15,
              ),
              child: MyText(
                text: '\$${product.price!.toStringAsFixed(2)}',
                size: 10,
                weight: FontWeight.w500,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                width: double.infinity,
                height: Dimensions.height45,
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(0),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.main),
                  ),
                  onPressed: ()  => Get.find<CartController>().addToCart(product),
                  child: const Text(
                    'Add to cart',
                  ),
                ),
              ),
            ),
          ],        ),
      ),
    );
  }
}
