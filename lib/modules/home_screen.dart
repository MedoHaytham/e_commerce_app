import 'package:e_commerce_app/models/Product_model.dart';
import 'package:e_commerce_app/models/cart%20model.dart';
import 'package:e_commerce_app/modules/cart_screen.dart';
import 'package:e_commerce_app/modules/product_details_screen.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:e_commerce_app/shared/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../layout/cubit/cubit.dart';
import '../layout/cubit/states.dart';
import '../shared/styles/colors.dart';

class HomeScreen extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => EcommerceCubit(),
      child: BlocConsumer<EcommerceCubit, EcommerceStates>(
        listener: (context, state) { },
        builder: (context, state)
        {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children:
              [
                const SizedBox(
                  height: 20,
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                      [
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: 45,
                            decoration: BoxDecoration(

                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: 'Search product',
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  )
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        IconBtnCounter(
                          svgSrc: 'assets/images/Cart.svg',
                          numOfItems: demoCarts.length,
                          press: ()
                          {
                            navigateTo(context, CartScreen());
                          },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        IconBtnCounter(
                          svgSrc: 'assets/images/Bell.svg',
                          numOfItems: 2,
                          press: (){},
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: FadeAnimation(
                      1,
                      Column(
                        children:
                        [
                          Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15
                              ),
                              width: double.infinity,
                              height: 90,
                              decoration: BoxDecoration(
                                color: Color(0xFF4A3298),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text.rich(
                                TextSpan(
                                  text: 'A Summer Surprise\n',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  children:
                                  [
                                    TextSpan(
                                      text: 'Cashback 20%',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                            //list.........
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                [
                                  CategoryBuilder(
                                    icon: 'assets/images/Flash.svg',
                                    label: 'Flash Deal',
                                    press: () {  },
                                  ),

                                  CategoryBuilder(
                                    icon: 'assets/images/Bill.svg',
                                    label: 'Bill',
                                    press: () {  },
                                  ),

                                  CategoryBuilder(
                                    icon: 'assets/images/Game.svg',
                                    label: 'Game',
                                    press: () {  },
                                  ),

                                  CategoryBuilder(
                                    icon: 'assets/images/Gift.svg',
                                    label: 'Daily Gift',
                                    press: () {  },
                                  ),

                                  CategoryBuilder(
                                    icon: 'assets/images/Discover.svg',
                                    label: 'More',
                                    press: () {  },
                                  ),
                                ],
                              ),
                            ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:
                                [
                                  Text(
                                    'Special for you',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      'See more',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    onTap: ()
                                    {

                                    },
                                  ),
                                ],
                              ),
                            ),
                          const SizedBox(
                            height: 20,
                          ),
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              child: Row(
                                children:
                                [
                                  SpecialOfferCard(
                                    category: 'Smart Phone',
                                    image: 'assets/images/ImageBanner1.png',
                                    numOfBrands: 15,
                                    press: () {},
                                  ),
                                  SpecialOfferCard(
                                    category: 'Fashion',
                                    image: 'assets/images/ImageBanner2.png',
                                    numOfBrands: 10,
                                    press: () {},
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:
                                [
                                  Text(
                                    'Popular product',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      'See more',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    onTap: ()
                                    {

                                    },
                                  ),
                                ],
                              ),
                            ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                              children:
                              [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  alignment: Alignment.center,
                                  height: 210,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (BuildContext context, index) => ProductCard(demoProducts[index], context, demoProducts[index].isPopular),
                                    separatorBuilder: (BuildContext context, index) =>  demoProducts[index].isPopular ? const SizedBox(
                                      width: 20,
                                    ) : const SizedBox(
                                      width: 0,
                                    ),
                                    itemCount: demoProducts.length,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget IconBtnCounter({
    required String svgSrc,
    required int numOfItems,
    required GestureTapCallback press,
  })=>InkWell(
    onTap: press,
    borderRadius: BorderRadius.circular(50),
    child: Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          height: 46,
          width: 46,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(svgSrc),
        ),
        if(numOfItems !=0)
          Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
              border: Border.all(width: 1.5, color: Colors.white),
            ),
            child: Center(
              child: Text('$numOfItems',
                style: const TextStyle(
                  fontSize: 10,
                  height: 1,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
      ],
    ),
  );

  Widget CategoryBuilder({
    required String icon,
    required String label,
    required GestureTapCallback press,
  })=>InkWell(
    onTap: press,
    borderRadius: BorderRadius.circular(10),
    child: Container(
      constraints: const BoxConstraints(maxWidth: 70),
      width: 55,
      child: Column (
        children:
        [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );

  Widget SpecialOfferCard({
    required String category,
    required String image,
    required int numOfBrands,
    required GestureTapCallback press,
  })=>Padding(
    padding: const EdgeInsets.only(
      left: 20,
    ),
    child: InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: press,
      child: SizedBox(
        width: 242,
        height: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children:
            [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:
                    [
                      const Color(0xFF343434).withOpacity(0.4),
                      const Color(0xFF343434).withOpacity(0.15),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: '$category\n',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text: '$numOfBrands Brands',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  Widget ProductCard(
      Product product,
      context,
      bool isPopular,
  )=> isPopular? InkWell(
    borderRadius: BorderRadius.circular(15),
    onTap: ()
    {
      navigateTo(context, ProductDetailsScreen(product: product));
    },
    child: SizedBox(
      width: 140,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.02,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xCBCACB).withOpacity(0.1),
              ),
              child: Image.asset(product.images[0]),
            ),
          ),
          Text(
            product.title,
            style: TextStyle(
              color: Colors.black,
            ),
            maxLines: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${product.price}\$',
                style: TextStyle(
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
                    color: const Color(0xBDBDBD).withOpacity(0.1),
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
    ),
  ) : const SizedBox.shrink();
}
