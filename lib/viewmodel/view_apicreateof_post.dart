import 'package:flutter/cupertino.dart';
import '../models/post_model.dart';
import '../services/http_service.dart';

class HomeViewModel extends ChangeNotifier {
  bool isLoading = false;
  List<Post> items = [];

  Future apiPostList() async {
    isLoading = true;
    notifyListeners();
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    isLoading = false;
    if (response != null) {
      items = Network.parsePostList(response);
    } else {
      items = [];
    }
    isLoading = false;
    notifyListeners();
  }
  Future<bool> apiPostCreate(Post post) async {
    isLoading = true;
    notifyListeners();
    var response = await Network.POST(Network.API_CREATE + post.id.toString(), Network.paramsCreate(post));
    isLoading = false;
    notifyListeners();
    return response != null;
  }
}