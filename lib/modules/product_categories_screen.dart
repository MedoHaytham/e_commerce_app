import 'package:e_commerce_app/models/categories_model.dart';
import 'package:e_commerce_app/modules/product_details_screen.dart';
import 'package:e_commerce_app/modules/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/Product_model.dart';
import '../shared/components/components.dart';

class ProductCategoriesScreen extends StatelessWidget {

  final Product ?product;
  final Categories ?categories;

  const ProductCategoriesScreen({super.key,
    this.product,
    this.categories,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    List<Product> filteredProducts = demoProducts.where((product) => product.category == categories!.title).toList();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            highlightColor: Colors.transparent,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          leadingWidth: 70,
          title: Text(
            categories!.title,
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          children:
          [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1 / 1.47,
                  ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) => ProductCard(filteredProducts[index], filteredProducts[index].category, context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ProductCard(
      Product product,
      String category,
      context,
      )=> categories!.title == category ? InkWell(
    borderRadius: BorderRadius.circular(15),
    onTap: ()
    {
      navigateTo(context, ProductDetailsScreen(product: product));
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children:
      [
        AspectRatio(
          aspectRatio: 1.02,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0x00cbcacb).withOpacity(0.1),
            ),
            child: Image.asset(product.images[0]),
          ),
        ),
        Text(

          product.title,
          style: Theme.of(context).textTheme.bodyMedium,
          maxLines: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${product.price}\$',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(28),
              onTap: ()
              {

              },
              child: Container(
                padding: const EdgeInsets.all(7),
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0x00bdbdbd).withOpacity(0.1),
                ),
                child: SvgPicture.asset(
                  product.isFavourite ? 'assets/images/HeartIcon_2.svg' :'assets/images/HeartIcon.svg',
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ) : const SizedBox.shrink();
}
