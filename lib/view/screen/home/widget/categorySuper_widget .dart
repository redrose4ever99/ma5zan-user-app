import 'package:flutter/material.dart';
import 'package:flutter_makzan_ecommerce/data/model/response/category.dart';
import 'package:flutter_makzan_ecommerce/utill/color_resources.dart';
import 'package:flutter_makzan_ecommerce/utill/custom_themes.dart';
import 'package:flutter_makzan_ecommerce/utill/dimensions.dart';

class CategorySuperWidget extends StatelessWidget {
  final SubCategory category;
  const CategorySuperWidget({Key key, @required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
      Container(
        child: Center(
          child: Text(
            category.name,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: titilliumRegular.copyWith(
                fontSize: Dimensions.FONT_SIZE_SMALL,
                color: ColorResources.getTextTitle(context)),
          ),
        ),
      ),
    ]);
  }
}
