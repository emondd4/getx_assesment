import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class CommonUtil {

  static CommonUtil instance = CommonUtil();

  /// Device
  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getScreenHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  /// Input
  void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  /// Internet Check
  Future<bool> internetCheck() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      debugPrint("No Internet");
      return false;
    }
    return true;
  }

  /// Show Toast
  void showToast(String msg) {
    dismissToast(Get.context);
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        content: Text(msg),
      ),
    );
  }

  void dismissToast(BuildContext? context) {
    ScaffoldMessenger.of(context!).clearSnackBars();
  }



  /// Handle Over-tapping
  DateTime? initialClickTime;

  bool isRedundantClick(DateTime currentTime, int redundantClickDuration) {
    if (initialClickTime == null) {
      initialClickTime = currentTime;
      return false;
    } else {
      if (currentTime
          .difference(initialClickTime!)
          .inSeconds < redundantClickDuration) { //set this difference time in seconds (ideally 3 sec)
        return true;
      }
    }
    initialClickTime = currentTime;
    return false;
  }

  /// String Operations
  String getTimeAndDate(String time) {
    try {
      final format = DateFormat('yyyy-MM-ddTHH:mm:ssZ','en-US');
      var dt =  format.parse(time); // format: 2021-09-13T04:43:07.000000Z
      return (
          '${dt.day>=10 ? dt.day : '0'+dt.day.toString()}'
              '-${dt.month>=10 ? dt.month : '0'+dt.month.toString()}'
              '-${dt.year} '
              '${ (dt.hour>12) ? dt.hour-12
              : (dt.hour>=10) ? dt.hour : '0'+dt.hour.toString()}'
              ':${(dt.minute>=10) ? dt.minute : '0'+dt.minute.toString()} ${((dt.hour>=12)) ? 'pm':'am'}');
    } catch (e) {
      return '';
    }
  }

  ///parse double to specific decimal points
  double? getParsedDoubleOfSpecificPoints({required double? givenNumber, int? specificPoints}) {
    return double.parse(givenNumber!.toStringAsFixed(specificPoints ?? 2));
  }

  ///Scroll Functionalities
  scrollToSpecificWidget({required GlobalKey widgetKey}) {
    Scrollable.ensureVisible(
      widgetKey.currentContext!,
      alignment: 1.0,
      alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
      duration: Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }

  ///Find widget visibility inside screen
  findWidgetVisibilityInsideScrollingScreen({required GlobalKey widgetKey}){
    final RenderObject? box = widgetKey.currentContext?.findRenderObject(); //     !
    if (box != null) {
      final double yPosition = (box as RenderBox).localToGlobal(Offset.zero).dy; // !
      print('Widget is visible in the viewport at position: $yPosition');
      // do stuff...
    }
    else {
      print('Widget is not visible.');
      // do stuff...
    }
  }


  ///check string is null or not
  checkStringIsNullOrNot({required dynamic data}){
    if (data != null) {
      return data.toString();
    }
    else {
      return " ";
    }
  }

}