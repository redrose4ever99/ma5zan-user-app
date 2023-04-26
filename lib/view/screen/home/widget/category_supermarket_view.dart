import 'package:flutter/material.dart';
import 'package:flutter_makzan_ecommerce/provider/category_provider.dart';
import 'package:flutter_makzan_ecommerce/view/screen/home/widget/category_widget.dart';
import 'package:flutter_makzan_ecommerce/view/screen/product/brand_and_category_product_screen.dart';
import 'package:provider/provider.dart';

import 'category_shimmer.dart';

class CategorySuperView extends StatelessWidget {
  final bool isHomePage;
  CategorySuperView({@required this.isHomePage});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, categoryProvider, child) {
        return categoryProvider.categoryList.length != 0
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 5,
                  childAspectRatio: (1 / 1.3),
                ),
                itemCount: isHomePage
                    ? categoryProvider.categoryList.length > 8
                        ? 8
                        : categoryProvider.categoryList.length
                    : categoryProvider.categoryList.length,
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
                                    id: categoryProvider.categoryList[index].id
                                        .toString(),
                                    name: categoryProvider
                                        .categoryList[index].name,
                                  )));
                    },
                    child: Visibility(
                      visible: (categoryProvider.categoryList[index].id == 2),
                      child: CategoryWidget(
                          category: categoryProvider.categoryList[index]),
                    ),
                  );
                },
              )
            : CategoryShimmer();
      },
    );
  }
}