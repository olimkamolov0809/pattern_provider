

import 'package:flutter/foundation.dart';

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

  Future<bool> apiPostUpdate(Post post) async {
    isLoading = true;
    notifyListeners();
    var response = await Network.GET(Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));
    isLoading = false;
    notifyListeners();

    return response != null;
  }
}