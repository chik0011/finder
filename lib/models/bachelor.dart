import 'package:faker/faker.dart';
import 'package:finder/models/gender.dart';

class Bachelor {
  final String fisrtname;
  final String lastname;
  final Gender gender;
  final String avatar;
  List<Gender> searchFor;
  String job;
  String description;

  Bachelor(
      {required this.fisrtname,
      required this.lastname,
      required this.gender,
      required this.avatar,
      required this.searchFor,
      required this.job,
      required this.description});

  String getAvatar() {
    return avatar;
  }

  String getIndentity() {
    return "$lastname $fisrtname";
  }

  String getDescription() {
    return description;
  }

  String getJob() {
    return job;
  }
}
