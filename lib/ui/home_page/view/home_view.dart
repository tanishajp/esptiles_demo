import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/subcategory_list_model.dart';
import '../../../utils/constants/color_constants.dart';
import '../controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorBlack,
        bottom: PreferredSize(
          preferredSize: const Size(0, 40), // Adjust height as needed
          child: Obx(
            () => Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      size: 20,
                      Icons.search,
                      color: colorWhite,
                    ),
                    SizedBox(width: 5),
                    Icon(
                      size: 20,
                      Icons.filter_alt_outlined,
                      color: colorWhite,
                    ),
                    SizedBox(width: 5),
                  ],
                ),
                const SizedBox(height: 10),
                controller.category.value.isNotEmpty
                    ? TabBar(
                        indicatorColor: colorBlack,
                        labelColor: colorWhite,
                        unselectedLabelColor: colorGrey,
                        controller: controller.tabController,
                        isScrollable:
                            true, // Optional: Allows scrolling if tabs overflow
                        tabs: List.generate(
                          controller.category.value.length,
                          (index) => Tab(
                            text: controller.category.value[index].name,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ), // Hide TabBar if categories are empty
          ),
        ),
      ),
      body: Obx(
        () => controller.isLoading.value == false
            ? controller.category.value.isNotEmpty
                ? DefaultTabController(
                    initialIndex: controller.initialIndex.value,
                    length: controller.category.value.length,
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller.tabController,
                      children: List.generate(
                        controller.category.value.length,
                        (index) {
                          return index == 1
                              ? subCategoryWidget()
                              : Center(
                                  child: Text(
                                    'Contents of ${controller.category.value[index].name}',
                                  ),
                                );
                        },
                      ),
                    ),
                  )
                : noDataFound()
            : circularProgress(),
      ),
    );
  }

  Widget subCategoryWidget() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: ListView.builder(
          controller: controller.loadMoreController,
          itemCount: controller.subCategories.value.length + 1,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            if (index == controller.subCategories.value.length) {
              return controller.isLastItem.value
                  ? Center(child: circularProgress()).paddingAll(20)
                  : const SizedBox.shrink();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.subCategories.value[index].name!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                productWidget(
                    context, controller.subCategories.value[index].product!)
              ],
            );
          }),
    );
  }

  Widget productWidget(BuildContext context, List<Product>? product) {
    return SizedBox(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: product?.length ?? 0,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return product != null
                ? SizedBox(
                    width: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          imageUrl: product[index].imageName!,
                          imageBuilder: (context, imageProvider) => Container(
                            height: 100,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => SizedBox(
                              height: 100,
                              width: 120,
                              child: circularProgress()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        Text(
                          product[index].name!,
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 12, overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  )
                : noDataFound();
          }),
    );
  }

  Widget circularProgress() {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: colorBlack,
      ),
    );
  }

  Widget noDataFound() {
    return const Text("No data Found");
  }
}
