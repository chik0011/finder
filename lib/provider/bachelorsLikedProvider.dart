import 'package:finder/models/bachelor.dart';
import 'package:flutter/material.dart';

class BachelorsLikedProvider extends ChangeNotifier {
  List<Bachelor> bachelorsLiked = [];

  List<Bachelor> getBachelorsLiked() {
    return bachelorsLiked;
  }

  void addBachelorLiked(Bachelor newBachelor) {
    if (!isLiked(newBachelor)) {
      bachelorsLiked.add(newBachelor);
      notifyListeners();
    }
  }

  bool isLiked(Bachelor bachelor) {
    return bachelorsLiked.contains(bachelor);
  }
}
