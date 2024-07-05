import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:impero_task/network/api_helper.dart';

import '../../../model/category_list_model.dart';
import '../../../model/subcategory_list_model.dart';
import '../usecase/home_use_case.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  final ApiHelper apiHelper;
  final HomeUseCase homeUseCase;

  Rx<List<Category>> category = Rx<List<Category>>([]);
  Rx<List<SubCategories>> subCategories = Rx<List<SubCategories>>([]);

  var isLoading = false.obs;
  var isLastItem = false.obs;

  int categoryPage = 1;
  var initialIndex = 1.obs;

  ScrollController loadMoreController = ScrollController();

  HomeController(
    this.apiHelper,
    this.homeUseCase,
  );

  @override
  void onInit() {
    super.onInit();

    getCategoryList();
    loadMoreController.addListener(loadMoreScroll);
  }

  void loadMoreScroll() {
    if (isLastItem.value) {
      if (loadMoreController.position.pixels ==
          loadMoreController.position.maxScrollExtent) {
        categoryPage++;

        getSubCategoryList();
      }
    }
  }

  void getCategoryList() {
    isLoading.value = true;
    homeUseCase.getCategoryList().then((value) {
      if (value.result?.category != null) {
        category.value = value.result!.category!;
        tabController =
            TabController(vsync: this, length: category.value.length);

        getSubCategoryList();
      } else {
        isLoading.value = false;
      }
    });
  }

  void getSubCategoryList() {
    homeUseCase.getSubCategoryList(categoryPage).then((value) {
      if (value.result?.category?.first.subCategories != null) {
        var subCategoriesList = value.result!.category!.first.subCategories!;

        isLoading.value = false;
        isLastItem.value = true;

        if (subCategoriesList.isNotEmpty) {
          subCategories.value = subCategories.value + subCategoriesList;
        }
      }
    });
  }
}
