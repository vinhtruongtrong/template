/*
 * @Author: vinhtruongtrong 
 * @Date: 2021-11-23 15:08:40 
 * @Last Modified by: vinhtruongtrong
 * @Last Modified time: 2021-11-24 10:48:42
 */
import 'package:post/domain/entities/post.dart';
import 'package:post/domain/repositories/post_repo.dart';
import 'package:template/core/src/data/models/result.dart';
import 'package:template/core/src/foundation/foundation.dart';

import 'params.dart';

class GetPostsPagingUseCase
    extends UseCase<Result<List<Post>>, GetPostsPagingParam> {
  final IPostRepo postRepo;

  GetPostsPagingUseCase({required this.postRepo});
  @override
  Future<Result<List<Post>>> call(GetPostsPagingParam params) {
    return Result.guardFuture(
      () => postRepo.getPostsPaging(params: params),
    );
  }
}
