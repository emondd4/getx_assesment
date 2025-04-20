import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sensometer_environment_monitoring/Models/LineChartBaseResponse.dart';
import 'package:sensometer_environment_monitoring/Models/NotificationListBaseResponse.dart';

import '../Models/BuildingDetailsBaseResponse.dart';
import '../Models/ChamberDetailsBaseResponse.dart';
import '../Models/DomainCheckBaseModel.dart';
import '../Models/GaugeDetailsBaseResponse.dart';
import '../Models/LoginBaseResponse.dart';
import '../Models/PremisesDetailsBaseResponse.dart';
import '../Models/PremisesListBaseResponse.dart';
import '../Models/RoomListBaseResponse.dart';
import 'api_client.dart';
import 'api_urls.dart';

class ApiRepository {
  ///Check Domain
  void checkDomain(BuildContext context, String url,
      Map<String, dynamic>? params, FormData body,
      {void Function(DomainCheckBaseModel)? onSuccess,
      void Function(String)? onFailure}) async {
    try {
      final response = await ApiClient.post(
          url + ApiUrls.domainValidation, params, body, false, false);
      var callResponse = DomainCheckBaseModel.fromJson(response);
      if (callResponse != null) {
        onSuccess!(callResponse);
      } else {
        debugPrint(callResponse.toString());
        onFailure!(callResponse.error!.message!);
      }
    } catch (e) {
      debugPrint(e.toString());
      onFailure!("Something Wrong With Your Url. \nPlease Check & try again!");
    }
  }

  ///Login
  void userLogin(BuildContext context, String url, Map<String, dynamic>? params,
      Map<String, dynamic>? body,
      {void Function(LoginBaseResponse)? onSuccess,
      void Function(String)? onFailure}) async {
    try {
      final response = await ApiClient.post(
          url + ApiUrls.loginEndPoint, params, body, false, false);
      var callResponse = LoginBaseResponse.fromJson(response);
      if (callResponse != null) {
        onSuccess!(callResponse);
      } else {
        debugPrint(callResponse.toString());
        onFailure!(callResponse.message!);
      }
    } catch (e) {
      debugPrint(e.toString());
      onFailure!("Something Went Wrong");
    }
  }

  ///Premises List
  void getPremises(BuildContext context, String url,
      Map<String, dynamic>? params, Map<String, dynamic>? body,
      {void Function(List<PremisesListBaseResponse>)? onSuccess,
      void Function(String)? onFailure}) async {
    try {
      final dio = Dio();
      final GetStorage getStorage = GetStorage();
      String? token = getStorage.read("Token");
      Response response = await dio.get(url + ApiUrls.premisesListEndPoint,
          queryParameters: params,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      var callResponse = (response.data as List)
          .map((x) => PremisesListBaseResponse.fromJson(x))
          .toList();
      if (callResponse != null) {
        onSuccess!(callResponse);
      } else {
        debugPrint(callResponse.toString());
        onFailure!("Something Went Wrong");
      }
    } catch (e) {
      debugPrint(e.toString());
      onFailure!("Something Went Wrong");
    }
  }

  ///Premises Details
  void premisesDetails(BuildContext context, String url, String premisesId,
      Map<String, dynamic>? params, Map<String, dynamic>? body,
      {void Function(PremisesDetailsBaseResponse)? onSuccess,
      void Function(String)? onFailure}) async {
    try {
      final response = await ApiClient.get(
          "$url${ApiUrls.premisesDetailsEndPoint}/$premisesId",
          params,
          true,
          false);
      var callResponse = PremisesDetailsBaseResponse.fromJson(response);
      if (callResponse != null) {
        onSuccess!(callResponse);
      } else {
        debugPrint(callResponse.toString());
        onFailure!(callResponse.message!);
      }
    } catch (e) {
      debugPrint(e.toString());
      onFailure!("Something Went Wrong");
    }
  }

  ///Building Details
  void buildingDetails(BuildContext context, String url, String premisesId,
      Map<String, dynamic>? params, Map<String, dynamic>? body,
      {void Function(BuildingDetailsBaseResponse)? onSuccess,
      void Function(String)? onFailure}) async {
    try {
      final response = await ApiClient.get(
          "$url${ApiUrls.buildingDetailsEndPoint}/$premisesId",
          params,
          true,
          false);
      var callResponse = BuildingDetailsBaseResponse.fromJson(response);
      if (callResponse != null) {
        onSuccess!(callResponse);
      } else {
        debugPrint(callResponse.toString());
        onFailure!(callResponse.message!);
      }
    } catch (e) {
      debugPrint(e.toString());
      onFailure!("Something Went Wrong");
    }
  }

  ///Building Details
  void roomList(BuildContext context, String url, Map<String, dynamic>? params,
      Map<String, dynamic>? body,
      {void Function(RoomListBaseResponse)? onSuccess,
      void Function(String)? onFailure}) async {
    try {
      final response = await ApiClient.get(
          "$url${ApiUrls.roomListEndPoint}", params, true, false);
      var callResponse = RoomListBaseResponse.fromJson(response);
      if (callResponse != null) {
        onSuccess!(callResponse);
      } else {
        debugPrint(callResponse.toString());
        onFailure!(callResponse.message!);
      }
    } catch (e) {
      debugPrint(e.toString());
      onFailure!("Something Went Wrong");
    }
  }

  ///Room Details
  void roomDetails(BuildContext context, String url, String roomId,
      Map<String, dynamic>? params, Map<String, dynamic>? body,
      {void Function(ChamberDetailsBaseResponse)? onSuccess,
      void Function(String)? onFailure}) async {
    try {
      final response = await ApiClient.get(
          "$url${ApiUrls.roomDetailsEndPoint}/$roomId", params, true, false);
      var callResponse = ChamberDetailsBaseResponse.fromJson(response);
      if (callResponse != null) {
        onSuccess!(callResponse);
      } else {
        debugPrint(callResponse.toString());
        onFailure!(callResponse.message!);
      }
    } catch (e) {
      debugPrint(e.toString());
      onFailure!("Something Went Wrong");
    }
  }

  ///Gauge Data List
  void gaugeDataList(BuildContext context, String url,
      Map<String, dynamic>? params, FormData body,
      {void Function(List<GaugeDetailsBaseResponse>)? onSuccess,
      void Function(String)? onFailure}) async {
    try {
      final dio = Dio();

      dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          // Modify the request here if needed
          print('REQUEST[${options.method}] => PATH: ${options.path}');
          return handler.next(options); // Proceed with the request
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          // Handle successful responses
          print('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
          return handler.next(response); // Proceed with the response
        },
        onError: (DioError error, ErrorInterceptorHandler handler) {
          // Handle errors
          print(
              'ERROR[${error.response?.statusCode}] => MESSAGE: ${error.message}');
          return handler.next(error); // Propagate the error
        },
      ));

      final GetStorage getStorage = GetStorage();
      String? token = getStorage.read("Token");
      Response response = await dio.post(url + ApiUrls.gaugeDetailsEndPoint,
          data: body,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      var callResponse = (response.data as List)
          .map((x) => GaugeDetailsBaseResponse.fromJson(x))
          .toList();
      if (callResponse != null) {
        onSuccess!(callResponse);
      } else {
        debugPrint(callResponse.toString());
        onFailure!("Something Went Wrong");
      }
    } catch (e) {
      debugPrint(e.toString());
      onFailure!("Something Went Wrong");
    }
  }

  ///Premises List
  void getNotifications(BuildContext context, String url,
      Map<String, dynamic>? params, Map<String, dynamic>? body,
      {void Function(NotificationListBaseResponse)? onSuccess,
      void Function(String)? onFailure}) async {
    try {
      final response = await ApiClient.get(
          "$url${ApiUrls.notificationListEndPoint}", params, true, false);
      var callResponse = NotificationListBaseResponse.fromJson(response);
      onSuccess!(callResponse);
    } catch (e) {
      debugPrint(e.toString());
      onFailure!("Something Went Wrong");
    }
  }

  ///Room Line Chart
  void roomLineChart(BuildContext context, String url, String roomId,
      Map<String, dynamic>? params, Map<String, dynamic>? body,
      {void Function(LineChartBaseResponse)? onSuccess,
        void Function(String)? onFailure}) async {
    try {
      Map<String,dynamic>  body = {"room_id":roomId};
      final response = await ApiClient.post(
          "$url${ApiUrls.lineChartListEndPoint}", params,body, true, false);
      var callResponse = LineChartBaseResponse.fromJson(response);
      onSuccess!(callResponse);
        } catch (e) {
      debugPrint(e.toString());
      onFailure!("Something Went Wrong");
    }
  }

}
