/*
 * @Author: vinhtruongtrong 
 * @Date: 2021-11-23 09:24:39 
 * @Last Modified by: vinhtruongtrong
 * @Last Modified time: 2021-11-25 17:10:10
 */
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:post/presentation/comment/page.dart';
import 'package:shimmer/shimmer.dart';
import 'package:template/app/routes/router.dart';
import 'package:template/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:post/presentation/post/viewmodel.dart';

class PostPage extends HookConsumerWidget {
  const PostPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final route = useRouter();
    final l10n = useL10n();
    final viewModel = ref.read(postViewModelProvider);
    final scrollController = useScrollController();
    useEffect(
      () {
        scrollController.addListener(() {
          if (scrollController.position.pixels >
              scrollController.position.maxScrollExtent - 40) {
            viewModel.fetchMorePosts();
          }
        });
        viewModel.refreshPosts();
      },
      [scrollController],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.greetingMessage('user'),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async => viewModel.refreshPosts(),
        child: Consumer(
          builder: (context, ref, _) {
            final posts = ref.watch(postViewModelProvider).posts;
            final itemLength = posts.length + (viewModel.canLoadMore ? 2 : 0);
            return ListView.separated(
              controller: scrollController,
              separatorBuilder: (_, __) => Container(
                height: 1,
                width: double.infinity,
                color: Colors.black12,
              ),
              itemBuilder: (context, index) {
                if (index >= posts.length) {
                  return Shimmer.fromColors(
                    baseColor: Colors.blueGrey.withOpacity(.1),
                    highlightColor: Colors.white.withOpacity(.3),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 200,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  height: 4,
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 4),
                                  width:
                                      MediaQuery.of(context).size.width - 220,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  final post = posts[index];
                  return ListTile(
                    onTap: () {
                      // route.pushWidget(
                      //   CommentPage(postId: post.id),
                      //   transitionBuilder: TransitionsBuilders.fadeIn,
                      //   fullscreenDialog: true,
                      // );
                      route.navigate(CommentRoute(postId: post.id));
                    },
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    leading: Hero(
                      tag: 'https://i.pravatar.cc/150?u=${post.id}',
                      transitionOnUserGestures: true,
                      child: CircleAvatar(
                        child: const CupertinoActivityIndicator(),
                        maxRadius: 24,
                        foregroundImage: NetworkImage(
                          'https://i.pravatar.cc/150?u=${post.id}',
                        ),
                        onForegroundImageError: (_, __) => Container(
                          child: const Icon(
                            Icons.info_outline_rounded,
                            color: Colors.orangeAccent,
                          ),
                          color: Colors.redAccent.withOpacity(.04),
                        ),
                        backgroundColor: Colors.blueGrey.withOpacity(.1),
                      ),
                    ),
                    title: Text(
                      post.title,
                      maxLines: 1,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    subtitle: Text(
                      post.body,
                      maxLines: 2,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                }
              },
              itemCount: itemLength,
            );
          },
        ),
      ),
    );
  }
}
