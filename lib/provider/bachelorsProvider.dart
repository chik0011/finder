import 'package:flutter/material.dart';
import 'package:finder/models/bachelor.dart';
import 'package:finder/data/people.dart';

class BachelorsProvider extends ChangeNotifier {
  List<Bachelor> bachelors = [];

  BachelorsProvider() {
    initBachelors();
  }

  List<Bachelor> getBachelors() {
    return bachelors;
  }

  void setBachelors(List<Bachelor> newBachelors) {
    bachelors = newBachelors;
  }

  void addBachelor(Bachelor newBachelor) {
    bachelors.add(newBachelor);
  }

  void initBachelors() {
    setBachelors(createPeople());
  }
}
