import 'package:authentication/domain/repositories/auth_repo.dart';
import 'package:authentication/domain/usecases/login/params.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'endpoint.dart';

final authRepoProvider = Provider<IAuthRepo>((ref) {
  return AuthRepo();
});

class AuthRepo implements IAuthRepo {
  @override
  Future<bool> login({required LoginParam params}) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    if (params.useName != 'vinh.truongtrong@gmail.com' ||
        params.password != '123123123') {
      throw Exception('Wrong usename or password');
    }
    return true;
    // final client = HttpHelper.getInstance();
    // final response = await client.post(_Endpoint.login, data: params.toJson());
    // return response.statusCode == 200;
  }
}
