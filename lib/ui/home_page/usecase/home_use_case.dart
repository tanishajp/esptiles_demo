import '../../../model/category_list_model.dart';
import '../../../model/subcategory_list_model.dart';
import '../../../network/api_client.dart';
import '../../../network/api_helper.dart';
import '../../../network/connection/connection_manager.dart';

class HomeUseCase extends ApiHelper {
  HomeUseCase(ConnectionController connectionManager)
      : super(connectionManager);

  Future<CategoryListModel> getCategoryList() async {
    final result = await postMethod(
      ApiClient.dashBoard,
      params: {
        "CategoryId": 0,
        "DeviceManufacturer": "Google",
        "DeviceModel": "Android SDK built for x86",
        "DeviceToken": "",
        "PageIndex": 1
      },
    );
    return CategoryListModel.fromJson(result!);
  }

  Future<SubCategoryListModel> getSubCategoryList(int pageIndex) async {
    final result = await postMethod(
      ApiClient.dashBoard,
      params: {
        "CategoryId": 56,
        "PageIndex": pageIndex,
      },
    );
    return SubCategoryListModel.fromJson(result!);
  }
}
