import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UIUtil {

  static UIUtil instance = UIUtil();

  /// Show Toast
  showToast(BuildContext context, String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black26,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  dismissToast(BuildContext context) {
    try {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    } catch (e) {
      print(e);
    }
  }

  void errorToast(BuildContext context, String msg, String buttonText, Function()? call) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.red,
        action: SnackBarAction(
          label: buttonText,
          textColor: Colors.white,
          onPressed:() => (call==null) ? dismissToast(context) : call,
        ),
      ),
    );
  }

  /// Loader Behavior
  void showLoading() {
    EasyLoading.show(status: 'Loading',
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black);
  }

  void stopLoading() {
    EasyLoading.dismiss(animation: true);
  }

  void onNoInternet() {
    EasyLoading.show(status: "No Internet!",
        indicator: const Icon(Icons.signal_cellular_connected_no_internet_4_bar,
          color: Colors.white70,),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black).then((value) {
      Timer(const Duration(seconds: 3), () => EasyLoading.dismiss());
    });

  }

  void onFailed(String failedMsg) {
    EasyLoading.show(status: failedMsg,
        indicator: const Icon(Icons.warning_amber_rounded, color: Colors.white70,),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black).then((value) {
      Timer(const Duration(seconds: 3), () => EasyLoading.dismiss());
    });
  }

  ///Custom Dialog
  showCustomDialog(BuildContext context,{required Widget? child, double? borderRadius = 10.0}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(borderRadius!)), //this right here
            child: Wrap(
              children: [
                child!,
              ],
            ),
          );
        }
    );
  }

  ///Alert Dialog
  showAlertDialog(BuildContext context,{String? title, String? subTitle , required Function()? actionFunction}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: (title != null) ? Center(child: FittedBox(child: Text(title))) : null,
            content: (subTitle != null) ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    subTitle,
                    // textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ) : null,
            actions: <Widget>[
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.red),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel')),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.grey),
                onPressed: actionFunction,
                child: const Text('Ok'),
              ),
            ],
          );
        }
    );
  }

  ///bottom sheet
  showBottomSheet(BuildContext context,{required Widget? child}){
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        builder: (builder) {
          return Wrap(
            children: [
              child!,
            ],
          );
        }
    );
  }


}