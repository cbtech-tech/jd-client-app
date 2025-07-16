import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:just_delivery/customWidgets/snackbar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/intl.dart';


class PdfDownloadController extends GetxController {
  var isLoading = false.obs;
  var filePath = ''.obs;

  Future<void> downloadPdf(String url, String orderId) async {
    print("==>>>downloadPdf(String $url, String $orderId) ");

    try {
      if (Platform.isAndroid) {
        var status = await Permission.storage.status;

        if (!status.isGranted) {
          status = await Permission.storage.request();

          if (status.isDenied) {
            // Ask again once if denied
            status = await Permission.storage.request();
          }

          if (status.isPermanentlyDenied) {
            SnackbarUtil.showErrorTop("Permission permanently denied. Please enable it from settings.");
            openAppSettings(); // Optionally open settings
            return;
          }

          if (!status.isGranted) {
            SnackbarUtil.showErrorTop("Permission Denied. Cannot access storage.");
            return;
          }
        }
      }

      // Format file name
      String formattedDate = DateFormat('dd-MM-yy').format(DateTime.now());
      String fileName = "consignment-${orderId}_$formattedDate.pdf";

      // Set download path
      Directory downloadDir;
      if (Platform.isAndroid) {
        downloadDir = Directory("/storage/emulated/0/Download");
      } else {
        downloadDir = await getApplicationDocumentsDirectory(); // iOS fallback
      }

      String savePath = "${downloadDir.path}/$fileName";
      filePath.value = savePath;

      // Start download
      Dio dio = Dio();
      await dio.download(
        url,
        savePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            print("Downloading: ${(received / total * 100).toStringAsFixed(0)}%");
          }
        },
      );

      SnackbarUtil.showSuccessTop("Saved as $fileName");
    } catch (e) {
      SnackbarUtil.showErrorTop("Download Failed: ${e.toString()}");
    }
  }


}
