import 'package:get/get.dart';

enum OrderBy {
  relevance,
  newest;

  @override
  String toString() => name.capitalize!;
}

class Constants {
  static String apiKey = "your_api_goes_here";
  static String volumesURL = "https://www.googleapis.com/books/v1/volumes";
}
