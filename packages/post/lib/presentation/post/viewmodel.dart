import 'package:template/core/src/foundation/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:post/data/post_repo_data.dart';
import 'package:post/domain/entities/post.dart';
import 'package:post/domain/repositories/post_repo.dart';
import 'package:post/domain/usecases/get_post_paging/get_post_paging.dart';
import 'package:post/domain/usecases/get_post_paging/usecase.dart';

final postViewModelProvider =
    ChangeNotifierProvider.autoDispose<PostViewModel>((ref) {
  return PostViewModel(ref.read);
});

class PostViewModel extends BaseViewModel {
  PostViewModel(this._reader);
  final Reader _reader;
  late final IPostRepo _postRepo = _reader(postRepoProvider);

  int _currentPage = 0;

  bool _canLoadMore = true;
  bool get canLoadMore => _canLoadMore;

  // final posts = ValueNotifier<List<Post>>([]);
  final posts = <Post>[];

  bool _isLoading = false;

  Future<void> refreshPosts() async {
    _currentPage = 0;
    _canLoadMore = true;
    posts.clear();
    await fetchMorePosts();
  }

  Future<void> fetchMorePosts() async {
    if (!_isLoading && _canLoadMore) {
      _isLoading = true;
      final useCase = GetPostsPagingUseCase(postRepo: _postRepo);
      final result = await useCase
          .call(GetPostsPagingParam(pageIndex: _currentPage, pageSize: 20))
          .then((posts) {
        return posts;
      }).catchError((error) {
        return const <Post>[];
      });

      if (result.isNotEmpty == true) {
        posts.addAll(result);
        _currentPage++;
      } else {
        _canLoadMore = false;
      }
      _isLoading = false;
      notifyListeners();
    }
  }
}
