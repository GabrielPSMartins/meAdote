import 'package:sqflite/sqflite.dart';
import '../database/database_provider.dart';
import '../models/post.dart';

class PostDAO {
  Future<List<Post>> getPosts({String filter = "todos"}) async {
    final db = await DatabaseProvider.instance.database;

    String where = "";
    List<dynamic> args = [];

    if (filter != "todos") {
      where = "WHERE type = ?";
      args = [filter];
    }

    final result = await db.rawQuery("""
      SELECT * FROM posts
      $where
      ORDER BY id DESC
    """, args);

    return result.map((e) => Post.fromMap(e)).toList();
  }

  Future<int> insertPost(Post post) async {
    final db = await DatabaseProvider.instance.database;
    return await db.insert("posts", post.toMap());
  }

  Future<Post?> getPostById(int id) async {
    final db = await DatabaseProvider.instance.database;

    final result = await db.query(
      "posts",
      where: "id = ?",
      whereArgs: [id],
      limit: 1,
    );

    if (result.isNotEmpty) {
      return Post.fromMap(result.first);
    }
    return null;
  }

  Future<int> deletePost(int id) async {
    final db = await DatabaseProvider.instance.database;
    return await db.delete(
      "posts",
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
