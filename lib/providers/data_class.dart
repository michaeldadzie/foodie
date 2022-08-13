import '../exports.dart';

class DataClass extends ChangeNotifier {
  DataModel? food;
  bool loading = false;

  getData() async {
    loading = true;
    food = await getFoodieData();
    loading = false;
    notifyListeners();
  }
}
