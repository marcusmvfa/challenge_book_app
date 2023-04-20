import 'package:get/get.dart';

enum OrderBy {
  relevance,
  newest;

  @override
  String toString() => name.capitalize!;
}

class Constants {
  static String apiKey = "AIzaSyDmRHMg2Xxaewa5WJWeSd49H_5w0Fx6w_s";
  static String volumesURL = "https://www.googleapis.com/books/v1/volumes";
}
