import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:just_delivery/constants/api_constants.dart';

String formatDateTime(String dateTimeString) {
  try {
    DateTime parsedDate = DateTime.parse(dateTimeString).toLocal();
    return DateFormat('dd/MM/yyyy, hh:mma').format(parsedDate);
  } catch (e) {
    return 'Invalid date';
  }
}

class LocationService {
  final Dio _dio = Dio();
  final String _apiKey = ApiConstants().YOUR_API_KEY;

  Future<String?> getAddressFromCoordinates(double lat, double lng) async {
    final String url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$_apiKey';

    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final results = response.data['results'];
        if (results != null && results.isNotEmpty) {
          return results[0]['formatted_address'];
        } else {
          return 'No address found';
        }
      } else {
        return 'Failed with status code: ${response.statusCode}';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}
