/*
 * @Author: vinhtruongtrong 
 * @Date: 2021-11-23 11:30:49 
 * @Last Modified by: vinhtruongtrong
 * @Last Modified time: 2021-11-25 14:49:03
 */
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/core/src/widgets/loading/container_with_loading.dart';
import 'package:template/core/src/widgets/loading/loading_state_viewmodel.dart';

import 'viewmodel.dart';

class CommentPage extends HookConsumerWidget {
  final int? postId;
  const CommentPage({Key? key, @QueryParam('id') this.postId})
      : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    assert(postId != null, 'Article is required.');
    final viewModel = ref.read(commentViewModelProvider);
    final headerLoadingState =
        useMemoized(() => LoadingStateViewModel().provider);
    final commentLoadingState =
        useMemoized(() => LoadingStateViewModel().provider);
    useEffect(
      () {
        ref
            .read(commentLoadingState)
            .whileLoading(() => viewModel.fetchComments(postId: postId ?? 0));

        ref
            .read(headerLoadingState)
            .whileLoading(() => viewModel.fetchHeader());
      },
      [],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
              tag: 'https://i.pravatar.cc/150?u=$postId',
              transitionOnUserGestures: true,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  'https://i.pravatar.cc/150?u=$postId',
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: ContainerWithLoading(
              loadingState: headerLoadingState,
              loading: const Text('Loading....'),
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
          Expanded(
            child: ContainerWithLoading(
              loadingState: commentLoadingState,
              child: Consumer(
                builder: (context, ref, _) {
                  final result = ref.watch(
                    commentViewModelProvider.select((value) => value.comments),
                  );
                  return result != null
                      ? result.when(
                          success: (comments) => ListView.separated(
                            separatorBuilder: (_, __) => const SizedBox(
                              height: 8,
                            ),
                            padding: const EdgeInsets.all(8),
                            itemBuilder: (context, index) {
                              final comment = comments.elementAt(index);
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.network(
                                      'https://i.pravatar.cc/150?u=${comment.email}',
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(.12),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            comment.email,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2,
                                          ),
                                          Text(
                                            comment.body,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            itemCount: comments.length,
                          ),
                          failure: (error) => Center(
                            child: Text(error.message),
                          ),
                        )
                      : const SizedBox();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
