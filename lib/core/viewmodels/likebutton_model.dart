import 'package:flutter_provider_architecture/core/services/post_service.dart';
import 'package:flutter_provider_architecture/core/viewmodels/base_model.dart';
import 'package:flutter_provider_architecture/locator.dart';

class LikeButtonModel extends BaseModel {
  PostService _postService = locator<PostService>();

  int postLikes(int postId) {
    return _postService.posts.firstWhere((post) => post.id == postId).likes;
  }

  void increaseLikes(int postId) {
    _postService.incrementLikes(postId);
    notifyListeners();
  }
}
