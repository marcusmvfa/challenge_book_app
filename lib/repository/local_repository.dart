import 'package:flutter_book_app/domain/model/book_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalRepository {
  LocalRepository() {
    open().then((value) async => await getFavoriteIds());
  }

  late Database _db;
  List favoritedIds = <String>[];

  Future<void> open() async {
    String path = await getDatabasesPath();
    String dbPath = "${path}books.db";
    _db = await openDatabase(dbPath, version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE books (
          id TEXT PRIMARY KEY,
          volumeInfo TEXT,
          saleInfo TEXT,
        )
      ''');
    });
  }

  Future<void> close() async {
    await _db.close();
  }

  Future favoriteBook(Book book) async {
    final id = await _db.insert('books', {'id': book.id, 'volumeInfo': book.volumeInfo!.toJson(), 'saleInfo': book.saleInfo!.toJson()});
    return id;
  }

  Future<int> removeBook(String taskId) async {
    return await _db.delete('books', where: 'id = ?', whereArgs: [taskId]);
  }

  Future<List<Book>> getBooks() async {
    List<Map<String, dynamic>> maps = await _db.query('books');
    return List.generate(maps.length, (i) {
      return Book.fromDatabase(Map.from(maps[i]))..isFavorited.value = true;
    });
  }

  Future getFavoriteIds() async {
    final result = await _db.query('books', columns: ['id']);
    favoritedIds = List.generate(result.length, (i) => Map.from(result[i])['id']);
  }
}
