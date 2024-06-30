
import 'package:get/get.dart';
import 'package:todoro/services/service.dart';

class DataController extends GetxController {
  DataService service = DataService();
  bool _isLoading = false;
  bool get isLodaing => _isLoading;
  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;

  Future<String> getData() async {
    Response response = await service.getData();
    if (response.statusCode == 200) {
      _myData = response.body;
      print(myData[0]['task_name']);
      print("we got the data");
      return myData[0]['task_name'];
    } else {
      print("we did not get the data");
      return "Data not found";
    }
  }
}
