/*
 * @Author: vinhtruongtrong 
 * @Date: 2021-11-24 10:56:11 
 * @Last Modified by: vinhtruongtrong
 * @Last Modified time: 2021-11-25 17:10:54
 */
import 'package:authentication/presentation/login/viewmodel.dart';
import 'package:authentication/presentation/login/widgets/form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/core/core.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final l10n = useL10n();

    final formKey = useMemoized(() => GlobalKey<FormState>());
    final usernameController =
        useTextEditingController(text: 'vinh.truongtrong@gmail.com');
    final passwordController = useTextEditingController(text: '123123123');

    final viewModel = ref.read(loginViewModelProvider);

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: MediaQuery.of(context).padding.copyWith(left: 24, right: 24),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Center(
                child: SvgPicture.network(
                  'https://portal.ree-pay.com/assets/v1/images/logo/brand-black.svg',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Đăng nhập bằng tài khoản Ree-Pay.',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(
                height: 24,
              ),
              HookConsumer(
                builder: (context, ref, _) {
                  final isLockUI = ref.watch(
                    loginViewModelProvider.select(
                      (value) => value.isLockUI,
                    ),
                  );
                  return LoginForm(
                    formKey: formKey,
                    usernameController: usernameController,
                    passwordController: passwordController,
                    isLockUI: isLockUI,
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    router.navigateNamed('forgot-password');
                  },
                  child: Text(l10n.forgotPasswordButton),
                ),
              ),
              HookConsumer(
                builder: (context, ref, _) {
                  final isLockUI = ref.watch(
                    loginViewModelProvider.select((value) => value.isLockUI),
                  );
                  return ElevatedButton(
                    onPressed: isLockUI
                        ? null
                        : () async {
                            if (formKey.currentState?.validate() == true) {
                              final userName = usernameController.text;
                              final password = passwordController.text;
                              await viewModel
                                  .login(userName: userName, password: password)
                                  .then((result) {
                                if (result) {
                                  router.replaceNamed('/home');
                                } else {
                                  // showDialog(
                                  //     context: context,
                                  //     builder: (_) {
                                  //       return CupertinoAlertDialog(
                                  //         title: const Text('Lỗi mẹ rồi'),
                                  //         content: Text(
                                  //           isLockUI.value.data.toString(),
                                  //         ),
                                  //       );
                                  //     });
                                }
                              });
                            }
                          },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...isLockUI
                            ? [
                                const CupertinoActivityIndicator(),
                                const SizedBox(
                                  width: 8,
                                )
                              ]
                            : [],
                        Text(l10n.loginButton)
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}