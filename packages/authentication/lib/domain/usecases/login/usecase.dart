/*
 * @Author: vinhtruongtrong 
 * @Date: 2021-11-24 11:20:35 
 * @Last Modified by: vinhtruongtrong
 * @Last Modified time: 2021-11-24 11:22:09
 */
import 'package:authentication/domain/repositories/auth_repo.dart';
import 'package:template/core/src/data/models/result.dart';
import 'package:template/core/src/foundation/foundation.dart';
import 'params.dart';

class LoginUseCase extends UseCase<Result<bool>, LoginParam> {
  final IAuthRepo authRepo;

  LoginUseCase({required this.authRepo});
  @override
  Future<Result<bool>> call(LoginParam params) {
    return Result.guardFuture(() => authRepo.login(params: params));
  }
}
