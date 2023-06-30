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

  void deleteBachelorLiked(Bachelor bachelor) {
    int index = 0;
    getBachelorsLiked().forEach((element) {
      if (bachelor == element) {
        bachelorsLiked.removeAt(index);
      }

      index++;
    });
  }

  bool isLiked(Bachelor bachelor) {
    return bachelorsLiked.contains(bachelor);
  }
}
