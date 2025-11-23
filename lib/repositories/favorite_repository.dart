import 'package:meadote_inicio/models/favorite.dart';

class FavoriteRepository {
  final List<Favorite> _favorites = [];

  Future<List<Favorite>> getFavoritesByUser(String userId) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _favorites.where((f) => f.userId == userId).toList();
  }

  Future<void> addFavorite(Favorite favorite) async {
    _favorites.add(favorite);
  }

  Future<void> removeFavorite(String favoriteId) async {
    _favorites.removeWhere((f) => f.id == favoriteId);
  }
}
