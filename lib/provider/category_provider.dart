import 'package:flutter/material.dart';
import 'package:flutter_makzan_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_makzan_ecommerce/data/model/response/category.dart';
import 'package:flutter_makzan_ecommerce/data/repository/category_repo.dart';
import 'package:flutter_makzan_ecommerce/helper/api_checker.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryRepo categoryRepo;

  CategoryProvider({@required this.categoryRepo});
  List<SubCategory> _supermarketList = [];
  List<Category> _categoryList = [];
  int _categorySelectedIndex;
  Category supermarket;
  List<Category> get categoryList => _categoryList;
  List<SubCategory> get supermarketList => _supermarketList;
  int get categorySelectedIndex => _categorySelectedIndex;

  Future<void> getCategoryList(bool reload, BuildContext context) async {
    if (_categoryList.length == 0 || reload) {
      ApiResponse apiResponse = await categoryRepo.getCategoryList();
      if (apiResponse.response != null &&
          apiResponse.response.statusCode == 200) {
        _categoryList.clear();
        apiResponse.response.data.forEach(
            (category) => _categoryList.add(Category.fromJson(category)));
        _categorySelectedIndex = 0;
      } else {
        ApiChecker.checkApi(context, apiResponse);
      }
      notifyListeners();
    }
  }

  Future<void> getSupermarketList(bool reload, BuildContext context) async {
    if (_categoryList.length == 0 || reload) {
      ApiResponse apiResponse = await categoryRepo.getSupermarketList();
      if (apiResponse.response != null &&
          apiResponse.response.statusCode == 200) {
        _categoryList.clear();
        _supermarketList.clear();
        apiResponse.response.data.forEach(
            (category) => _categoryList.add(Category.fromJson(category)));
        _categorySelectedIndex = 0;

        for (var i = 0; i < _categoryList.length; i++) {
          // TO DO
          var currentElement = _categoryList[i];
          if (currentElement.id == 2) {
            supermarket = currentElement;
          }
        }


        supermarket.subCategories.forEach((subCateegory)=>{
          _supermarketList.add(subCateegory)

        });
        _supermarketList.forEach((element) {print(element.name);
        print("element.name");});
        //   print(subCateegory.name);
      } else {
        ApiChecker.checkApi(context, apiResponse);
      }
      notifyListeners();
    }
  }

  void changeSelectedIndex(int selectedIndex) {
    _categorySelectedIndex = selectedIndex;
    notifyListeners();
  }
}
