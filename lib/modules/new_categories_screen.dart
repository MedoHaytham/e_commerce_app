import 'package:e_commerce_app/layout/cubit/cubit.dart';
import 'package:e_commerce_app/layout/cubit/states.dart';
import 'package:e_commerce_app/models/new_categories_model.dart';
import 'package:e_commerce_app/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> EcommerceCubit(),
      child: BlocConsumer<EcommerceCubit, EcommerceStates>(
        listener: (context, state) { },
        builder: (context, state) {
          var cubit = EcommerceCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Categories',
              ),
            ),
            body: Row(
              children:
              [
                SafeArea(
                  child: SizedBox(
                    width: 87,
                    child: ListView.separated(
                      itemBuilder:(context, index) => GestureDetector(
                        onTap: ()
                        {
                          cubit.changeCategoryItem(index);
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: 87,
                              padding: const EdgeInsets.only(
                                left: 12,
                                right: 5,
                                top: 10,
                                bottom: 10,
                              ),
                              decoration: BoxDecoration(
                                color: cubit.catIndex == index ? Theme.of(context).colorScheme.background : const Color(0xFFF5F6F9),
                                borderRadius: cubit.preIndex == index || cubit.postIndex == index
                                    ? BorderRadius.only(
                                      topRight: cubit.postIndex == index
                                        ? Radius.circular(20)
                                        : Radius.zero,
                                      bottomRight: cubit.preIndex == index
                                          ? Radius.circular(20)
                                          : Radius.zero,
                                    )
                                    : null
                              ),
                              child: Column(
                                children:
                                [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        railCategories[index].catImageUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    railCategories[index].catName,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 12,
                                      color: AppCubit.get(context).isDark ? cubit.catIndex == index ? Colors.white : Colors.black : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 6,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 1500),
                                curve: Curves.fastLinearToSlowEaseIn,
                                width: index == cubit.catIndex ? 8: 0,
                                height: 80,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.primary,
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 1,
                      ),
                      itemCount: railCategories.length,
                    ),
                  ),
                ),
                Expanded(
                  child: SupCategories(context),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  Widget SupCategories(
      context
      )=>Container(
    padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5
    ),
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 4/6,
        crossAxisSpacing: 15,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) => Column(
        children:
        [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                subCategoryItems[EcommerceCubit.get(context).catIndex][index].catImageUrl,
                loadingBuilder: (context, child, loadingProgress) {
                  if(loadingProgress == null)
                  {
                    return child;
                  }
                  else
                  {
                    return Image.asset('assets/images/loadingImage.png');
                  }
                },
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            subCategoryItems[EcommerceCubit.get(context).catIndex][index].catName,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 12,
              color: AppCubit.get(context).isDark ? EcommerceCubit.get(context).catIndex == index ? Colors.white : Colors.black : Colors.black,
            ),
          ),
        ],
      ),
      itemCount: subCategoryItems[EcommerceCubit.get(context).catIndex].length,
    ),
  );
}
