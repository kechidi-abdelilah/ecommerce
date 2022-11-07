import 'package:ecommerce/pages/Categorie/Controllers/categories_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecommerce/core/theme/colors.dart';
import 'package:ecommerce/core/utils/dimesions.dart';
import 'package:ecommerce/pages/home/ui/widgets/my_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../routes/routes.dart';
import '../../controllers/data_controller.dart';

class Categories extends StatelessWidget {
  Categories({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.height10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: 'Category',
            size: Dimensions.font16,
            weight: FontWeight.w500,
            textOverflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          Padding(
            padding: EdgeInsets.all(Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryIconText(
                  label: 'jewelery',
                  icon: 'assets/icons/jewelery.svg',
                ),
                CategoryIconText(
                  label: "men's clothing",
                  icon: 'assets/icons/men.svg',
                ),
                CategoryIconText(
                  label: 'electronics',
                  icon: 'assets/icons/electro.svg',
                ),
                CategoryIconText(
                  label: "women's clothing",
                  icon: 'assets/icons/women.svg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryIconText extends StatelessWidget {
  DataController dataController = Get.put(DataController());
  CategoryIconText({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);
  final String label;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await dataController.changeCategoryName(label);
        Get.toNamed(Routes.categories, arguments: "$label");
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(Dimensions.height5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius8),
              color: AppColors.main.withOpacity(.2),
            ),
            child: SvgPicture.asset(
              icon,
              height: Dimensions.height40,
              width: Dimensions.width40,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: Dimensions.height5,
          ),
          MyText(
            text: label,
            size: Dimensions.font14,
            color: AppColors.secondary,
            textOverflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
