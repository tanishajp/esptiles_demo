import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'api_client.dart';
import 'connection/connection_manager.dart';

class ApiHelper extends GetConnect {
  final ConnectionController connectionManager;

  ApiHelper(this.connectionManager);

  Future<Map<String, dynamic>?> postMethod<T>(
    String endPoint, {
    Map<String, dynamic> params = const {},
  }) async {
    if (await connectionManager.isConnected() ?? false) {
      try {
        Uri getUri = Uri.parse(ApiClient.baseUrl + endPoint);

        var response = await post(getUri.toString(), params);
        if (response.statusCode == 200) {
          return response.body;
        }
        return null;
      } catch (exception) {
        throw Fluttertoast.showToast(
            msg: 'Some Exception message',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16);
      }
    } else {
      throw Fluttertoast.showToast(
          msg: "Try Connecting Network",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16);
    }
  }
}
