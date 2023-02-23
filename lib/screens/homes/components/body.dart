import 'package:domas_ecommerce/constants.dart';
import 'package:domas_ecommerce/screens/homes/components/home_header.dart';
import 'package:domas_ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'discount_banner.dart';
import 'categories.dart';
import 'special_offers.dart';
import 'popular_product.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: getProportionateScreenWidth(20)),
          HomeHeader(),
          SizedBox(height: getProportionateScreenWidth(10)),
          DiscountBanner(),
          Categories(),
          SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
          PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
          
        ],
      )),
    );
  }
}