import 'package:e_commerce_app/layout/cubit/cubit.dart';
import 'package:e_commerce_app/layout/cubit/states.dart';
import 'package:e_commerce_app/models/cart%20model.dart';
import 'package:e_commerce_app/modules/size_config.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../shared/styles/colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});


  double calculateTotalPrice(List<Cart> carts) {
    double totalPrice = 0.0;
    for (Cart cart in carts)
    {
      totalPrice += cart.product.price * cart.numOfItem;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context)
  {
    SizeConfig.init(context);
    return BlocProvider(
      create: (context) => EcommerceCubit(),
      child: BlocConsumer<EcommerceCubit, EcommerceStates>(
        listener: (context, state) { },
        builder: (context, state)
        {
          var cubit = EcommerceCubit.get(context);
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
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:
                [
                  const Text(
                    'Your cart',
                  ),
                  if(demoCarts.isNotEmpty)
                    Text(
                      '${demoCarts.length} items',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                ],
              ),
            ),
            body: demoCarts.isNotEmpty ? Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => CartItem(demoCarts[index],context),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: demoCarts.length,
              ),
            ) : const Center(child: Text(
              'Cart is Empty',
            )),
            bottomNavigationBar: demoCarts.isNotEmpty ? Container(
              padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenWidth(15),
                horizontal: getProportionateScreenHeight(30),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                boxShadow:
                [
                  BoxShadow(
                    offset: const Offset(0, -15),
                    color: const Color(0xFFDADADA).withOpacity(0.15),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children:
                  [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                      [
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: getProportionateScreenHeight(40),
                          width: getProportionateScreenWidth(40),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F6F9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(
                            'assets/images/receipt.svg',
                            color: KmainColor,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: 45,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F6F9),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Add voucher code',
                              hintStyle: TextStyle(
                                color: Colors.black38,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                      [
                        Text.rich(
                          TextSpan(
                            text: 'Total:\n',
                            style: Theme.of(context).textTheme.bodySmall,
                            children:
                            [
                              TextSpan(
                                text: '\$${calculateTotalPrice(demoCarts).toStringAsFixed(2)}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(190),
                          child: defaultButton(
                            function: ()
                            {

                            },
                            text: 'check out',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ) : const SizedBox.shrink(),
          );
        },
      ),
    );
  }
  Widget CartItem(
      Cart cart,
      BuildContext context,
  )=>InkWell(
    borderRadius: BorderRadius.circular(15),
    onTap: ()
    {

    },
    child: Dismissible(
      direction: DismissDirection.endToStart,
      key: UniqueKey(),
      background: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFFFE6E6),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children:
          [
            const Spacer(),
            SvgPicture.asset('assets/images/Trash.svg'),
          ],
        ),
      ),
      onDismissed: (direction)
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
                  color: const Color(0xFFF5F6F9),
                ),
                child: Image.asset(cart.product.images[0]),
              ),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(20),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Text(
                    cart.product.title,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text.rich(
                    TextSpan(
                        text: '\$${cart.product.price} ',
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                        children:
                        [
                          TextSpan(
                            text: 'x${cart.numOfItem}',
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                        ]
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}



