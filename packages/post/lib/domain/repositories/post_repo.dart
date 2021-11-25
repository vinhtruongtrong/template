/*
 * @Author: vinhtruongtrong 
 * @Date: 2021-11-22 14:11:21 
 * @Last Modified by: vinhtruongtrong
 * @Last Modified time: 2021-11-23 15:01:40
 */
import 'package:post/domain/entities/comment.dart';
import 'package:post/domain/usecases/get_post_paging/get_post_paging.dart';

import '../entities/post.dart';

abstract class IPostRepo {
  Future<List<Post>> getPosts();
  Future<List<Post>> getPostsPaging({required GetPostsPagingParam params});
  Future<List<Comment>> getComments({required int postId});
}
