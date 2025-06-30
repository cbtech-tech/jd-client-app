import 'package:get/get.dart';
import 'package:just_delivery/screens/dashboard_screen/home_screen/liveTracking/liveTrackingDataModel.dart';

import '../../../../api/api_service.dart';
import '../../../../constants/api_constants.dart';
import '../../../../customWidgets/customLoader.dart';

class LiveTrackingController extends GetxController{

  final ApiService apiService = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    fetchLiveData();



  }

  Future<void> fetchLiveData() async {
   // LoaderUtil.showLoader();


    try{
      final response = await apiService.getRequest(ApiConstants().liveTrackingApi);

      if(response.isSuccess){

        LiveTrackingModel liveTrackingModel = LiveTrackingModel.fromJson(response.data);


        print("=>>>>liveTrackingModel  ${liveTrackingModel.toJson()}");
      //  LoaderUtil.showLoader();

      }
      else{

        print("no data ");
      //  LoaderUtil.showLoader();

      }




    }catch(e){


    }






  }

}