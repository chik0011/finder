import 'package:finder/models/bachelor.dart';
import 'package:finder/models/gender.dart';
import 'package:faker/faker.dart';
import 'dart:math';

List<Bachelor> createPeople() {
  List<Bachelor> res = [];
  Faker faker = Faker();

  for (var i = 0; i < 30; i++) {
    int rdmInt = getRandomInteger(2);
    Gender gender = getRandomGender(rdmInt);

    Bachelor bachelor = Bachelor(
        fisrtname: faker.person.firstName(),
        lastname: faker.person.lastName(),
        gender: gender,
        avatar: getAvatar(gender),
        searchFor: [],
        job: faker.job.title(),
        description: faker.lorem.sentence());

    res.add(bachelor);
  }

  return res;
}

String getAvatar(Gender gender) {
  int valuePicture = getRandomInteger(15) + 1;
  String pathBygender = gender == Gender.male ? "images/man" : "images/woman";

  return "$pathBygender-$valuePicture.png";
}

int getRandomInteger(int maxValue) {
  Random rng = Random();
  return rng.nextInt(maxValue);
}

Gender getRandomGender(int rdm) {
  List<Gender> lstGender = [Gender.male, Gender.female];

  return lstGender[rdm];
}
