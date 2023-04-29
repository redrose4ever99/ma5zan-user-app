import 'package:flutter/material.dart';
import 'package:flutter_makzan_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_makzan_ecommerce/data/model/response/category.dart';
import 'package:flutter_makzan_ecommerce/data/repository/category_repo.dart';
import 'package:flutter_makzan_ecommerce/helper/api_checker.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryRepo categoryRepo;

  CategoryProvider({@required this.categoryRepo});
  List<Category> _supermarketList = [];
  List<Category> _categoryList = [];
  int _categorySelectedIndex;

  List<Category> get categoryList => _categoryList;
  List<Category> get supermarketList => _supermarketList;

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
    if (_supermarketList.length == 0 || reload) {
      ApiResponse apiResponse = await categoryRepo.getSupermarketList();
      if (apiResponse.response != null &&
          apiResponse.response.statusCode == 200) {
        _categoryList.clear();
        apiResponse.response.data.forEach(
            (category) => _supermarketList.add(Category.fromJson(category)));
        _categorySelectedIndex = 0;
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
