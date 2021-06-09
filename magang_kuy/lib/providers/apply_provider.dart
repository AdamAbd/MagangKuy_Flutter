part of 'providers.dart';

class ApplyProvider with ChangeNotifier {
  List<ApplicationModel> _apply = [];

  List<ApplicationModel> get apply => _apply;

  set apply(List<ApplicationModel> apply) {
    _apply = apply;
    notifyListeners();
  }
}
