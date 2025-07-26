import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';

import '../constants/image_constants.dart';

final List<Map<String, String>> deliveryReportData = [
  {
    "checkpointName": "Blue Tokai AREO MALL(Pune)",
    "checkpointCode": "",
    "inTime": "12-05-2025 02:29",
    "inTemp": "3.25 °C",
    "outTime": "12-05-2025 02:49",
    "outTemp": "8.06 °C",
    "ignOn": "0:20",
    "ignOff": "0:0",
    "timeSpent": "0:19",
    "eta": "00:0 00:0",
    "status": "Delayed By 2:30",
    "distance": "0",
    "overspeed": "0 (80)",
  },
  {
    "checkpointName": "BT KHARADI (PUNE)",
    "checkpointCode": "",
    "inTime": "12-05-2025 03:01",
    "inTemp": "5.31 °C",
    "outTime": "12-05-2025 03:11",
    "outTemp": "18.62 °C",
    "ignOn": "0:05",
    "ignOff": "0:05",
    "timeSpent": "0:10",
    "eta": "00:0 00:0",
    "status": "Delayed By 3:02",
    "distance": "9.35",
    "overspeed": "0 (80)",
  },
  {
    "checkpointName": "BT KALYANI NAGAR (PUNE)",
    "checkpointCode": "",
    "inTime": "12-05-2025 03:19",
    "inTemp": "3.68 °C",
    "outTime": "12-05-2025 03:27",
    "outTemp": "24.06 °C",
    "ignOn": "0:05",
    "ignOff": "0:03",
    "timeSpent": "0:08",
    "eta": "00:0 00:0",
    "status": "Delayed By 3:19",
    "distance": "16.27",
    "overspeed": "0 (80)",
  },
  {
    "checkpointName": "BT KOREGAON PARK (PUNE)",
    "checkpointCode": "",
    "inTime": "12-05-2025 03:29",
    "inTemp": "41.12 °C",
    "outTime": "12-05-2025 03:55",
    "outTemp": "-33.75 °C",
    "ignOn": "0:10",
    "ignOff": "0:16",
    "timeSpent": "0:25",
    "eta": "00:0 00:0",
    "status": "Delayed By 3:29",
    "distance": "18.19",
    "overspeed": "0 (80)",
  },
  {
    "checkpointName": "BT NIBM (PUNE)",
    "checkpointCode": "",
    "inTime": "12-05-2025 04:11",
    "inTemp": "3.56 °C",
    "outTime": "12-05-2025 04:15",
    "outTemp": "-2.62 °C",
    "ignOn": "0:01",
    "ignOff": "0:03",
    "timeSpent": "0:04",
    "eta": "00:0 00:0",
    "status": "Delayed By 4:12",
    "distance": "29.12",
    "overspeed": "0 (80)",
  },
  {
    "checkpointName": "BT GHOLE RD (PUNE)",
    "checkpointCode": "BT",
    "inTime": "12-05-2025 04:43",
    "inTemp": "6.87 °C",
    "outTime": "12-05-2025 04:57",
    "outTemp": "-2.31 °C",
    "ignOn": "0:04",
    "ignOff": "0:10",
    "timeSpent": "0:13",
    "eta": "00:0 00:0",
    "status": "Delayed By 4:43",
    "distance": "43.86",
    "overspeed": "0 (80)",
  },
];

// Future<void> generateDeliveryReportPDF(List<Map<String, dynamic>> deliveryReportData) async {
//   final pdf = pw.Document();
//   final imageLogo = pw.MemoryImage(
//     (await rootBundle.load(ImageConstants.jdPdfLogo)).buffer.asUint8List(),
//   );
//   final call = pw.MemoryImage(
//     (await rootBundle.load(ImageConstants.call)).buffer.asUint8List(),
//   );
//   final email = pw.MemoryImage(
//     (await rootBundle.load(ImageConstants.mail)).buffer.asUint8List(),
//   );

//   final footerWidth = PdfPageFormat.a4.width * 0.9;

//   pdf.addPage(
//     pw.MultiPage(
//       pageFormat: PdfPageFormat.a4.landscape,
//       build:
//           (context) => [
//             // Header
//             pw.Row(
//               mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//               children: [
//                 pw.Image(imageLogo, width: 80, height: 80),
//                 pw.Column(
//                   crossAxisAlignment: pw.CrossAxisAlignment.end,
//                   children: [
//                     pw.Row(
//                       children: [
//                         pw.Text(
//                           "Invoice Number: ",
//                           style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
//                         ),
//                         pw.Text(
//                           "CRN1845806620",
//                           style: pw.TextStyle(color: PdfColors.grey800),
//                         ),
//                       ],
//                     ),
//                     pw.Row(
//                       children: [
//                         pw.Text(
//                           "Date: ",
//                           style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
//                         ),
//                         pw.Text(
//                           "06 Jun 2025",
//                           style: pw.TextStyle(color: PdfColors.grey800),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             pw.SizedBox(height: 10),

//             // Table Header
//             pw.TableHelper.fromTextArray(
//               headers: [
//                 "Checkpoint Name",
//                 "Checkpoint Code",
//                 "In Time",
//                 "In Temp",
//                 "Out Time",
//                 "Out Temp",
//                 "Ign On",
//                 "Ign Off",
//                 "Time Spent",
//                 "ETA",
//                 "Status",
//                 "Cumulative Distance",
//                 "Overspeed Count",
//               ],
//               cellAlignment: pw.Alignment.centerLeft,
//               headerStyle: pw.TextStyle(
//                 fontWeight: pw.FontWeight.bold,
//                 fontSize: 10,
//               ),
//               headerDecoration: pw.BoxDecoration(color: PdfColors.grey300),
//               cellStyle: pw.TextStyle(fontSize: 9),
//               data:
//                   deliveryReportData.map((row) {
//                     return [
//                       row["checkpointName"],
//                       row["checkpointCode"],
//                       row["inTime"],
//                       row["inTemp"],
//                       row["outTime"],
//                       row["outTemp"],
//                       row["ignOn"],
//                       row["ignOff"],
//                       row["timeSpent"],
//                       row["eta"],
//                       row["status"],
//                       row["distance"],
//                       row["overspeed"],
//                     ];
//                   }).toList(),
//             ),

//             pw.SizedBox(height: 20),

//             // Footer
//             pw.Divider(thickness: 1),
//             // Footer inside a centered box
//             pw.Center(
//               child: pw.Container(
//                 width: footerWidth,
//                 child: pw.Column(
//                   children: [
//                     pw.SizedBox(height: 10),

//                     pw.Row(
//                       crossAxisAlignment: pw.CrossAxisAlignment.start,
//                       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                       children: [
//                         // Left Column
//                         pw.Column(
//                           crossAxisAlignment: pw.CrossAxisAlignment.start,
//                           children: [
//                             pw.Text(
//                               "Smartshift Logistics Solutions Pvt. Ltd.",
//                               style: pw.TextStyle(
//                                 fontWeight: pw.FontWeight.bold,
//                                 fontSize: 10,
//                               ),
//                             ),
//                             pw.SizedBox(height: 2),
//                             pw.Text(
//                               "Main Office: 301B, Jolly Bhavan2, New Marine\nLines, Mumbai 400020",
//                               style: pw.TextStyle(fontSize: 9),
//                             ),
//                           ],
//                         ),

//                         // Center Column - Signature
//                         pw.Column(
//                           children: [
//                             pw.Text(
//                               "Signature Behalf\nof JustDeliveries",
//                               textAlign: pw.TextAlign.center,
//                               style: pw.TextStyle(fontSize: 9),
//                             ),
//                             pw.SizedBox(height: 6),
//                             pw.Container(
//                               width: 30,
//                               height: 30,
//                               decoration: pw.BoxDecoration(
//                                 color: PdfColors.white,
//                                 shape: pw.BoxShape.circle,
//                                 border: pw.Border.all(
//                                   color: PdfColors.black,
//                                   width: 0.5,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),

//                         // Right Column - Contact Info
//                         pw.Column(
//                           crossAxisAlignment: pw.CrossAxisAlignment.start,
//                           mainAxisAlignment: pw.MainAxisAlignment.start,
//                           children: [
//                             pw.Row(
//                               children: [
//                                 pw.Image(email, height: 12, width: 12),

//                                 pw.Text(
//                                   " sales@jdindia.co.in",
//                                   style: pw.TextStyle(fontSize: 9),
//                                 ),
//                               ],
//                             ),
//                             pw.SizedBox(height: 2),
//                             pw.Row(
//                               children: [
//                                 pw.Image(call, height: 12, width: 12),
//                                 pw.Text(
//                                   " +91 9819440499",
//                                   style: pw.TextStyle(fontSize: 9),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     pw.SizedBox(height: 8),
//                     pw.Text(
//                       "GSTIN no.: 27AACGR8772D1ZZ | SAC code: 996511 | CIN: U74999MH2014PTC301620 | PAN: AACGR8772D",
//                       style: pw.TextStyle(fontSize: 8),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//     ),
//   );

//   final output = await getTemporaryDirectory();
//   final file = File("${output.path}/delivery_report.pdf");
//   await file.writeAsBytes(await pdf.save());
//   await OpenFile.open(file.path);
// }

Future<void> generateDeliveryReportPDF(
  List<Map<String, dynamic>> deliveryReportData,
) async {
  final pdf = pw.Document();
  final imageLogo = pw.MemoryImage(
    (await rootBundle.load(ImageConstants.jdPdfLogo)).buffer.asUint8List(),
  );
  final call = pw.MemoryImage(
    (await rootBundle.load(ImageConstants.call)).buffer.asUint8List(),
  );
  final email = pw.MemoryImage(
    (await rootBundle.load(ImageConstants.mail)).buffer.asUint8List(),
  );

  final footerWidth = PdfPageFormat.a4.width * 0.9;

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4.landscape,
      build:
          (context) => [
            // Header
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Image(imageLogo, width: 80, height: 80),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Row(
                      children: [
                        pw.Text(
                          "Invoice Number: ",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                        pw.Text(
                          deliveryReportData.isNotEmpty
                              ? (deliveryReportData.first["invoiceNO"] ?? '')
                              : '',
                          style: pw.TextStyle(color: PdfColors.grey800),
                        ),
                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.Text(
                          "Date: ",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                        pw.Text(
                          deliveryReportData.isNotEmpty
                              ? (deliveryReportData.first["date"] ?? '')
                              : '',
                          style: pw.TextStyle(color: PdfColors.grey800),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 10),

            // Table with limited fields
            pw.TableHelper.fromTextArray(
              headers: [
                "Checkpoint Name",
                "In Time",
                "In Temp",
                "Out Time",
                "Out Temp",
                "Time Spent (min)",
              ],
              cellAlignment: pw.Alignment.centerLeft,
              headerStyle: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                fontSize: 10,
              ),
              headerDecoration: pw.BoxDecoration(color: PdfColors.grey300),
              cellStyle: pw.TextStyle(fontSize: 9),
              data:
                  deliveryReportData.map((row) {
                    return [
                      row["checkpointName"] ?? '',
                      row["inTime"] ?? '',
                      row["inTemp"] ?? '',
                      row["outTime"] ?? '',
                      row["outTemp"] ?? '',
                      row["timeSpent"] ?? '',
                    ];
                  }).toList(),
            ),

            pw.SizedBox(height: 20),

            // Footer
            pw.Divider(thickness: 1),
            pw.Center(
              child: pw.Container(
                width: footerWidth,
                child: pw.Column(
                  children: [
                    pw.SizedBox(height: 10),
                    pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        // Left Column
                        pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              "Smartshift Logistics Solutions Pvt. Ltd.",
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                            pw.SizedBox(height: 2),
                            pw.Text(
                              "Main Office: 301B, Jolly Bhavan2, New Marine\nLines, Mumbai 400020",
                              style: pw.TextStyle(fontSize: 9),
                            ),
                          ],
                        ),

                        // Center Column
                        pw.Column(
                          children: [
                            pw.Text(
                              "Signature Behalf\nof JustDeliveries",
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(fontSize: 9),
                            ),
                            pw.SizedBox(height: 6),
                            pw.Container(
                              width: 30,
                              height: 30,
                              decoration: pw.BoxDecoration(
                                color: PdfColors.white,
                                shape: pw.BoxShape.circle,
                                border: pw.Border.all(
                                  color: PdfColors.black,
                                  width: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Right Column
                        pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          children: [
                            pw.Row(
                              children: [
                                pw.Image(email, height: 12, width: 12),
                                pw.Text(
                                  " sales@jdindia.co.in",
                                  style: pw.TextStyle(fontSize: 9),
                                ),
                              ],
                            ),
                            pw.SizedBox(height: 2),
                            pw.Row(
                              children: [
                                pw.Image(call, height: 12, width: 12),
                                pw.Text(
                                  " +91 9819440499",
                                  style: pw.TextStyle(fontSize: 9),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 8),
                    pw.Text(
                      "GSTIN no.: 27AACGR8772D1ZZ | SAC code: 996511 | CIN: U74999MH2014PTC301620 | PAN: AACGR8772D",
                      style: pw.TextStyle(fontSize: 8),
                    ),
                  ],
                ),
              ),
            ),
          ],
    ),
  );

  final output = await getTemporaryDirectory();
  final file = File("${output.path}/delivery_report.pdf");
  await file.writeAsBytes(await pdf.save());
  await OpenFile.open(file.path);
}
