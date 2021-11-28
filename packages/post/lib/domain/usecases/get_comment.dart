/*
 * @Author: vinhtruongtrong 
 * @Date: 2021-11-23 11:26:10 
 * @Last Modified by: vinhtruongtrong
 * @Last Modified time: 2021-11-24 10:48:32
 */
import 'package:post/domain/entities/comment.dart';
import 'package:post/domain/repositories/post_repo.dart';
import 'package:template/core/src/data/models/result.dart';
import 'package:template/core/src/foundation/foundation.dart';

class GetCommentsUseCase extends UseCase<Result<List<Comment>>, int> {
  GetCommentsUseCase({required this.postRepo});

  final IPostRepo postRepo;

  @override
  Future<Result<List<Comment>>> call(int params) {
    return Result.guardFuture(
      () => postRepo.getComments(postId: params),
    );
  }
}
