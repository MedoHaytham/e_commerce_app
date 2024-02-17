import 'package:e_commerce_app/layout/cubit/cubit.dart';
import 'package:e_commerce_app/layout/cubit/states.dart';
import 'package:e_commerce_app/models/Product_model.dart';
import 'package:e_commerce_app/modules/size_config.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:e_commerce_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../layout/e_commerce_layout.dart';
import '../shared/cubit/cubit.dart';

class ProductDetailsScreen extends StatelessWidget
{

  final Product ?product;

  const ProductDetailsScreen({super.key, 
    this.product,
  });

  @override
  Widget build(BuildContext context)
  {
    SizeConfig.init(context);
    return BlocProvider(
      create: (BuildContext context) => EcommerceCubit(),
      child: BlocConsumer<EcommerceCubit, EcommerceStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          var cubit = EcommerceCubit.get(context);
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            body: SingleChildScrollView(
              child: Column(
                children:
                [
                  CustomeAppBar(rate: '${product!.rating}',context: context),
                  ProductImage(image: product!.images[cubit.imageIndex]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => SmallPreview(images: product!.images[index], index: index, context: context),
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 15,
                          ),
                          itemCount: product!.images.length,
                        ),
                      ),
                    ],
                  ),
                  TopRoundedContainer(
                    color: Theme.of(context).colorScheme.background,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        ProductDetails(
                          title: product!.title,
                          description: product!.description,
                          context: context,
                        ),
                        TopRoundedContainer(
                          color: Theme.of(context).colorScheme.onSecondary,
                          child: Column(
                            children:
                            [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Row(
                                  children:
                                  [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width - 168,
                                      height: 40,
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) => ColorSelceted(color: product!.colors![index], index: index, context: context),
                                        separatorBuilder: (context, index) => const SizedBox(
                                          width: 2,
                                        ),
                                        itemCount: product!.colors!.length,
                                      ),
                                    ),
                                    const Spacer(),
                                    RoundedIconBtn(
                                      context: context,
                                      press: ()
                                      {
                                        cubit.minusCounter();
                                      },
                                      icon: Icons.remove,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      '${cubit.numOfItem}',
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    RoundedIconBtn(
                                      context: context,
                                      press: ()
                                      {
                                        cubit.plusCounter();
                                      },
                                      icon: Icons.add,
                                    ),
                                  ],
                                ),
                              ),
                              TopRoundedContainer(
                                color: Theme.of(context).colorScheme.background,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: SizeConfig.screenWidth! * 0.15,
                                    right: SizeConfig.screenWidth! * 0.15,
                                    top: getProportionateScreenWidth(15),
                                    bottom: getProportionateScreenWidth(40),
                                  ),
                                  child: defaultButton(
                                    text: 'add to cart',
                                    function: () {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


  Widget TopRoundedContainer({
    required Color color,
    required Widget child,
    double ?height,
  }) => Container(
    margin: const EdgeInsets.only(top: 20),
    padding: const EdgeInsets.only(top: 20),
    width: double.infinity,
    height: height,
    decoration: BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(35),
        topRight: Radius.circular(35),
        bottomRight: Radius.circular(35),
        bottomLeft: Radius.circular(35),
      ),
    ),
    child: child,
  );


  Widget RoundedIconBtn({
    required GestureTapCallback press,
    required IconData icon,
    required context
  })=>SizedBox(
    height: 40,
    width: 40,
    child: MaterialButton(
      onPressed: press,
      padding: const EdgeInsets.only(left: 0),
        color: AppCubit.get(context).isDark ? const Color(0xFFF5F6F9) : Colors.white,
      elevation: 0,
      highlightElevation: 0,
      shape: const CircleBorder(side: BorderSide.none),
      child: Icon(
        icon,
        color: Colors.black,
      ),
    ),
  );

  Widget CustomeAppBar({
    required String rate,
    context
  })=>SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20, vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RoundedIconBtn(
            context: context,
            press: ()
            {
              Navigator.pop(context);
            },
            icon: Icons.arrow_back_ios,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            decoration: BoxDecoration(
              color: AppCubit.get(context).isDark ? const Color(0xFFF5F6F9) : Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Text(
                  rate,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SvgPicture.asset('assets/images/StarIcon.svg'),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget SmallPreview({
    required String images,
    required int index,
    required BuildContext context,
  })=>InkWell(
    onTap: ()
    {
      EcommerceCubit.get(context).changeImagePrev(index);
    },
    child: Container(
      padding: const EdgeInsets.all(8),
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6F9),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: EcommerceCubit.get(context).imageIndex == index ? KmainColor : Colors.transparent,
        ),
      ),
      child: Image.asset(images),
    ),
  );

  Widget ProductImage({
    required String image,
  })=>SizedBox(
    width: 238,
    child: AspectRatio(
      aspectRatio: 1,
      child: Image.asset(image),
    ),
  );

  Widget ProductDetails({
    required String title,
    required description,
    required BuildContext context,
  })=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:
    [
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: ()
          {

          },
          child: Container(
            padding: const EdgeInsets.all(15),
            width: 64,
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xFFFFE6E6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SvgPicture.asset(
              product!.isFavourite ? 'assets/images/HeartIcon_2.svg' :'assets/images/HeartIcon.svg',
              color: Colors.red,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          right: 64,
          left: 20,
        ),
        child: Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppCubit.get(context).isDark ? Colors.white60 : Colors.grey.shade600,
          ),
          maxLines: EcommerceCubit.get(context).isReadMore ?  null : 3,
          overflow: EcommerceCubit.get(context).isReadMore ? TextOverflow.visible : TextOverflow.ellipsis,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: GestureDetector(
          onTap: ()
          {
            EcommerceCubit.get(context).changeReadButton();
          },
          child: Row(
            children:
            [
              Text(
                EcommerceCubit.get(context).isReadMore ? 'See less details' : 'See more details',
                style: const TextStyle(
                  color: KmainColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 12,
                color: KmainColor,
              ),
            ],
          ),
        ),
      ),
    ],
  );

  Widget ColorSelceted({
    required Color color,
    required int index,
    required BuildContext context,
  })=>InkWell(
    onTap: ()
    {
      EcommerceCubit.get(context).changeColorPrev(index);
    },
    child: Container(
      padding: const EdgeInsets.all(8),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: EcommerceCubit.get(context).colorIndex == index ? KmainColor : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    ),
  );
}


