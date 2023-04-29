import 'package:flutter/material.dart';
import 'package:flutter_makzan_ecommerce/provider/category_provider.dart';
import 'package:flutter_makzan_ecommerce/view/screen/home/widget/category_widget.dart';
import 'package:flutter_makzan_ecommerce/view/screen/product/brand_and_category_product_screen.dart';
import 'package:provider/provider.dart';

import 'category_shimmer.dart';

class SupermarketView extends StatelessWidget {
  final bool isHomePage;
  SupermarketView({@required this.isHomePage});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, categoryProvider, child) {
        return categoryProvider.supermarketList.length != 0
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 5,
                  childAspectRatio: (1 / 1.3),
                ),
                itemCount: isHomePage
                    ? categoryProvider.supermarketList.length > 8
                        ? 8
                        : categoryProvider.supermarketList.length
                    : categoryProvider.supermarketList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => BrandAndCategoryProductScreen(
                                    isBrand: false,
                                    id: categoryProvider
                                        .supermarketList[index].id
                                        .toString(),
                                    name: categoryProvider
                                        .supermarketList[index].name,
                                  )));
                    },
                    child: CategoryWidget(
                        category: categoryProvider.supermarketList[index]),
                  );
                },
              )
            : CategoryShimmer();
      },
    );
  }
}
