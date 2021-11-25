import 'package:post/domain/entities/post.dart';
import 'package:post/domain/repositories/post_repo.dart';
import 'package:template/core/src/foundation/foundation.dart';

class GetPostsUseCase extends NoParamsUseCase<List<Post>> {
  GetPostsUseCase({required this.postRepo});

  final IPostRepo postRepo;

  @override
  Future<List<Post>> call() {
    return postRepo.getPosts();
  }
}
