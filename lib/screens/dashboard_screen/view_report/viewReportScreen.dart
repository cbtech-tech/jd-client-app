import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_delivery/screens/dashboard_screen/view_report/pdfController.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class PdfViewerScreen extends StatelessWidget {
  final String url;
  final PdfDownloadController controller = Get.put(PdfDownloadController());
final String appBarName;
  final String orderId;

  PdfViewerScreen({super.key,required this.appBarName, required this.url,required this.orderId});




  @override
  Widget build(BuildContext context) {

    controller.downloadPdf(url,orderId);
    return Scaffold(
      appBar: AppBar(title: const Text("Consignment Report")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.filePath.isEmpty) {
          return const Center(child: Text("Failed to load PDF"));
        }
        return SfPdfViewer.file(File(controller.filePath.value));
      }),
    );
  }
}
