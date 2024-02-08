import 'package:e_commerce_app/modules/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../layout/e_commerce_layout.dart';
import '../models/Product_model.dart';
import '../shared/components/components.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Favorites',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => FavoriteItem(demoProducts[index], demoProducts[index].isFavourite),
          separatorBuilder: (context, index) => demoProducts[index].isFavourite ? const SizedBox(
            height: 10,
          ) : const SizedBox(
            height: 0,
          ),
          itemCount: demoProducts.length,
        ),
      ),
    );
  }
  Widget FavoriteItem(
      Product product,
      bool isFavorite
  )=>isFavorite ? InkWell(
    borderRadius: BorderRadius.circular(15),
    onTap: ()
    {

    },
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        SizedBox(
          width: getProportionateScreenWidth(88),
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFFF5F6F9),
              ),
              child: Image.asset(product.images[0]),
            ),
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(20),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Text(
                  product.title,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                    text: '\$${product.price} ',
                    style: TextStyle(
                        color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 1,
          child: InkWell(
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
                color: const Color(0xBDBDBD).withOpacity(0.1),
              ),
              child: SvgPicture.asset(
                product.isFavourite ? 'assets/images/HeartIcon_2.svg' :'assets/images/HeartIcon.svg',
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    ),
  ) : const SizedBox.shrink();
}
