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

  List<Comment>? _comments = [];
  List<Comment>? get comments => _comments;
  set comments(List<Comment>? value) {
    _comments = value;
    notifyListeners();
  }

  Future<void> fetchComments({required int postId}) async {
    final useCase = GetCommentsUseCase(postRepo: _postRepo);
    comments = await useCase.call(postId);
  }
}
