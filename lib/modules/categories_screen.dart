import 'package:e_commerce_app/layout/cubit/cubit.dart';
import 'package:e_commerce_app/layout/cubit/states.dart';
import 'package:e_commerce_app/models/Product_model.dart';
import 'package:e_commerce_app/models/categories_model.dart';
import 'package:e_commerce_app/modules/product_categories_screen.dart';
import 'package:e_commerce_app/modules/size_config.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => EcommerceCubit(),
      child: BlocConsumer<EcommerceCubit, EcommerceStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SizeConfig.init(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Categories',
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
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      physics: const BouncingScrollPhysics(),
                      children: List.generate(
                        demoCategories.length,
                            (index) => CategoriesItem(demoCategories[index],context),
                      ),
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

  Widget CategoriesItem(
      Categories categories,
      context
  )=>InkWell(
    borderRadius: BorderRadius.circular(15),
    onTap: ()
    {
      navigateTo(context, ProductCategoriesScreen(
        categories: categories,
      ));
    },
    child: SizedBox(
      width: getProportionateScreenWidth(160),
      child: AspectRatio(
        aspectRatio: 0.88,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xFFF5F6F9),
          ),
          child: Stack(
            children:
            [
              Text(
                categories.title,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 23.0,
                ),
                child: Image.asset(categories.image),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
