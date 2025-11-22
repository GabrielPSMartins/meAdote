import '../database/post_dao.dart';
import '../models/post.dart';

class PostRepository {
  final _dao = PostDAO();

  Future<List<Post>> getPosts({String filter = "todos"}) async {
    return await _dao.getPosts(filter: filter);
  }

  Future<int> insertPost(Post post) async {
    return await _dao.insertPost(post);
  }

  Future<Post?> getPostById(int id) async {
    return await _dao.getPostById(id);
  }

  Future<int> deletePost(int id) async {
    return await _dao.deletePost(id);
  }
}
