import 'package:template/core/src/data/models/result.dart';
import 'package:template/core/src/foundation/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:post/data/post_repo_data.dart';
import 'package:post/domain/entities/comment.dart';
import 'package:post/domain/repositories/post_repo.dart';
import 'package:post/domain/usecases/get_comment.dart';

final commentViewModelProvider =
    ChangeNotifierProvider.autoDispose<CommentViewModel>((ref) {
  return CommentViewModel(ref.read);
});

class CommentViewModel extends BaseViewModel {
  CommentViewModel(this._reader);

  final Reader _reader;
  late final IPostRepo _postRepo = _reader(postRepoProvider);

  Result<List<Comment>>? _comments;
  Result<List<Comment>>? get comments => _comments;

  Future<void> fetchComments({required int postId}) async {
    await Future.delayed(const Duration(seconds: 3));
    final useCase = GetCommentsUseCase(postRepo: _postRepo);
    useCase
        .call(postId)
        .then((value) => _comments = value)
        .whenComplete(notifyListeners);
  }

  Future<void> fetchHeader() async {
    await Future.delayed(const Duration(seconds: 5));
  }
}
