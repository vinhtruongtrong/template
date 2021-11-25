/*
 * @Author: vinhtruongtrong 
 * @Date: 2021-11-22 14:12:51 
 * @Last Modified by: vinhtruongtrong
 * @Last Modified time: 2021-11-23 15:01:29
 */

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:post/domain/entities/comment.dart';
import 'package:post/domain/entities/post.dart';
import 'package:post/domain/repositories/post_repo.dart';
import 'package:post/domain/usecases/get_post_paging/params.dart';
import 'package:template/core/core.dart';

part 'endpoint.dart';

final postRepoProvider = Provider<IPostRepo>((ref) {
  return PostRepo();
});

class PostRepo implements IPostRepo {
  @override
  Future<List<Post>> getPosts() async {
    final client = HttpHelper.getInstance();
    final response = await client.get(_Endpoint.posts);
    final data = (response.data as Iterable)
        .map((e) => Post.fromJson(e as Map<String, dynamic>))
        .toList();
    return data;
  }

  @override
  Future<List<Comment>> getComments({required int postId}) async {
    final client = HttpHelper.getInstance();
    final response = await client
        .get(_Endpoint.comments, queryParameters: {'postId': postId});
    final data = (response.data as Iterable)
        .map((e) => Comment.fromJson(e as Map<String, dynamic>))
        .toList();
    return data;
  }

  @override
  Future<List<Post>> getPostsPaging({
    required GetPostsPagingParam params,
  }) async {
    final postItems = await getPosts();
    if (params.pageIndex * params.pageSize > postItems.length) {
      return [];
    } else {
      final startIndex = params.pageIndex * params.pageSize;
      final endIndex = startIndex + params.pageSize;
      return postItems.sublist(
        startIndex,
        endIndex > postItems.length ? null : endIndex,
      );
    }
  }
}
