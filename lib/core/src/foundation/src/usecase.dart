/*
 * @Author: vinhtruongtrong 
 * @Date: 2021-11-22 13:37:40 
 * @Last Modified by:   vinhtruongtrong 
 * @Last Modified time: 2021-11-22 13:37:40 
 */
abstract class BaseUseCase<T> {
  const BaseUseCase();
}

abstract class UseCase<T, P> extends BaseUseCase<T> {
  const UseCase() : super();

  Future<T> call(P params);
}

abstract class NoParamsUseCase<T> extends BaseUseCase<T> {
  const NoParamsUseCase() : super();

  Future<T> call();
}
