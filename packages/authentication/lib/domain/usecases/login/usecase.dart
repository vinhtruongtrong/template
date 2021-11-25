/*
 * @Author: vinhtruongtrong 
 * @Date: 2021-11-24 11:20:35 
 * @Last Modified by: vinhtruongtrong
 * @Last Modified time: 2021-11-24 11:22:09
 */
import 'package:authentication/domain/repositories/auth_repo.dart';
import 'package:template/core/src/foundation/foundation.dart';
import 'params.dart';

class LoginUseCase extends UseCase<bool, LoginParam> {
  final IAuthRepo authRepo;

  LoginUseCase({required this.authRepo});
  @override
  Future<bool> call(LoginParam params) {
    return authRepo.login(params: params);
  }
}
