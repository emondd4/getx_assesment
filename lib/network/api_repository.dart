import 'package:dio/dio.dart';
import 'api_client.dart';
import 'api_urls.dart';

class ApiRepository {

  /// Get Product List
  // void getPremises(BuildContext context, String url,
  //     Map<String, dynamic>? params, Map<String, dynamic>? body,
  //     {void Function(List<PremisesListBaseResponse>)? onSuccess,
  //     void Function(String)? onFailure}) async {
  //   try {
  //     final dio = Dio();
  //     final GetStorage getStorage = GetStorage();
  //     String? token = getStorage.read("Token");
  //     Response response = await dio.get(url + ApiUrls.premisesListEndPoint,
  //         queryParameters: params,
  //         options: Options(headers: {"Authorization": "Bearer $token"}));
  //     var callResponse = (response.data as List)
  //         .map((x) => PremisesListBaseResponse.fromJson(x))
  //         .toList();
  //     if (callResponse != null) {
  //       onSuccess!(callResponse);
  //     } else {
  //       debugPrint(callResponse.toString());
  //       onFailure!("Something Went Wrong");
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     onFailure!("Something Went Wrong");
  //   }
  // }
  //
  ///Product Details
  // void premisesDetails(BuildContext context, String url, String premisesId,
  //     Map<String, dynamic>? params, Map<String, dynamic>? body,
  //     {void Function(PremisesDetailsBaseResponse)? onSuccess,
  //     void Function(String)? onFailure}) async {
  //   try {
  //     final response = await ApiClient.get(
  //         "$url${ApiUrls.premisesDetailsEndPoint}/$premisesId",
  //         params,
  //         true,
  //         false);
  //     var callResponse = PremisesDetailsBaseResponse.fromJson(response);
  //     if (callResponse != null) {
  //       onSuccess!(callResponse);
  //     } else {
  //       debugPrint(callResponse.toString());
  //       onFailure!(callResponse.message!);
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     onFailure!("Something Went Wrong");
  //   }
  // }

}
