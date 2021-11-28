import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:validator/input_validator.dart';
import 'package:template/core/src/widgets/loading/loading_state_viewmodel.dart';

class LoginForm extends HookConsumerWidget {
  const LoginForm({
    Key? key,
    this.formKey,
    this.usernameController,
    this.passwordController,
    this.loadingState,
  }) : super(key: key);

  final _userNameKey = const ValueKey('_userNameKey');
  final _passwordKey = const ValueKey('_passwordKey');

  final GlobalKey<FormState>? formKey;
  final TextEditingController? usernameController;
  final TextEditingController? passwordController;
  final ChangeNotifierProvider<LoadingStateViewModel>? loadingState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = loadingState != null
        ? ref
            .watch(
              loadingState!,
            )
            .isLoading
        : false;
    return Form(
      key: formKey,
      onChanged: () {},
      child: Column(
        children: [
          TextFormField(
            key: _userNameKey,
            controller: usernameController,
            enabled: !isLoading,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              labelText: 'Username',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: 'e.g. example@example.com',
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (input) {
              if (!InputValidator.isNotNullOrEmpty(input)) {
                return 'Not allow empty';
              }

              if (!InputValidator.isValidEmail(input!)) {
                return 'Email not valid';
              }
            },
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            key: _passwordKey,
            controller: passwordController,
            enabled: !isLoading,
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (input) {
              if (!InputValidator.isNotNullOrEmpty(input)) {
                return 'Not allow empty password';
              }

              if (!InputValidator.isValidPassword(input!)) {
                return 'Password at least 6 character';
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              hintText: 'e.g. xxxxxx',
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              labelText: 'Password',
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
        ],
      ),
    );
  }
}
