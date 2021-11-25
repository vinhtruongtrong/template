/*
 * @Author: vinhtruongtrong 
 * @Date: 2021-11-24 11:08:03 
 * @Last Modified by: vinhtruongtrong
 * @Last Modified time: 2021-11-24 11:08:27
 */
import '../usecases/usecases.dart';

abstract class IAuthRepo {
  Future<bool> login({required LoginParam params});
}
