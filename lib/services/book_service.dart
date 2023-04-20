import 'package:dio/dio.dart';
import 'package:flutter_book_app/domain/constants/constants.dart';
import 'package:flutter_book_app/domain/dto/book_response_dto.dart';

class BookService {
  Future<BookResponseDto> fetchBooks(String pattern, OrderBy orderBy) async {
    final result = await Dio().get(Constants.volumesURL, queryParameters: {'key': Constants.apiKey, 'q': pattern, 'orderBy': orderBy.name, 'maxResults': 40});
    return BookResponseDto.fromMap(result.data);
  }
}
