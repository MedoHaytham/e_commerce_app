import 'package:e_commerce_app/layout/e_commerce_layout.dart';
import 'package:e_commerce_app/models/cart%20model.dart';
import 'package:e_commerce_app/modules/size_config.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../shared/styles/colors.dart';

class CartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        elevation: 0,
        leading: IconButton(
          highlightColor: Colors.transparent,
          onPressed: () {
            navigateTo(context, EcommerceLayout());
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:
          [
            Text(
              'Your cart',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            if(demoCarts.isNotEmpty)
              Text(
              '${demoCarts.length} items',
              style: Theme.of(context).textTheme.caption,
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
          itemBuilder: (context, index) => CartItem(demoCarts[index]),
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
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          boxShadow:
          [
            BoxShadow(
              offset: Offset(0, -15),
              color: Color(0xFFDADADA).withOpacity(0.15),
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
                    padding: EdgeInsets.all(10),
                    height: getProportionateScreenHeight(40),
                    width: getProportionateScreenWidth(40),
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset('assets/images/receipt.svg'),
                  ),
                  Container(
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
                          hintText: 'Add voucher code',
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
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                      children:
                      [
                        TextSpan(
                          text: '\$334',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
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
  }
  Widget CartItem(
      Cart cart
  )=>Dismissible(
    direction: DismissDirection.endToStart,
    key: UniqueKey(),
    background: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFFFE6E6),
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
              child: Image.asset(cart.product.images[0]),
            ),
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(20),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Text(
              cart.product.title,
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
                  text: '\$${cart.product.price} ',
                  style: TextStyle(
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
      ],
    ),
  );
}



