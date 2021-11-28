/*
 * @Author: vinhtruongtrong 
 * @Date: 2021-11-24 10:43:52 
 * @Last Modified by: vinhtruongtrong
 * @Last Modified time: 2021-11-24 16:13:00
 */

import 'package:authentication/data/auth_repo.dart';
import 'package:authentication/domain/repositories/auth_repo.dart';
import 'package:authentication/domain/usecases/login/params.dart';
import 'package:authentication/domain/usecases/login/usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/core/src/data/models/result.dart';
import 'package:template/core/src/foundation/foundation.dart';

final loginViewModelProvider =
    ChangeNotifierProvider.autoDispose<LoginViewModel>((ref) {
  return LoginViewModel(ref.read);
});

class LoginViewModel extends BaseViewModel {
  LoginViewModel(this._reader);
  final Reader _reader;
  late final IAuthRepo _authRepo = _reader(authRepoProvider);

  Future<Result<bool>> login({
    required String userName,
    required String password,
  }) async {
    final useCase = LoginUseCase(authRepo: _authRepo);
    final params = LoginParam(useName: userName, password: password);
    return await useCase.call(params);
  }
}
