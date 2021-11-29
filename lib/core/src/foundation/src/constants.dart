/*
 * @Author: vinhtruongtrong 
 * @Date: 2021-11-22 11:27:48 
 * @Last Modified by: vinhtruongtrong
 * @Last Modified time: 2021-11-22 11:28:47
 */
import 'package:enum_to_string/enum_to_string.dart';

enum Flavor { development, production }

class Constants {
  const Constants._({
    required this.endpoint,
    required this.apiKey,
  });

  factory Constants.of() {
    final flavor = EnumToString.fromString(
      Flavor.values,
      const String.fromEnvironment('FLAVOR'),
    );

    switch (flavor) {
      case Flavor.development:
        return Constants._dev();
      case Flavor.production:
      default:
        return Constants._prd();
    }
  }

  factory Constants._dev() {
    return const Constants._(
      endpoint: 'https://jsonplaceholder.typicode.com',
      apiKey: '98c8df982b8b4da8b86cd70e851fc521',
    );
  }

  factory Constants._prd() {
    return const Constants._(
      endpoint: 'https://jsonplaceholder.typicode.com',
      apiKey: '4bc454db94464956aea4cbb01f4bf9f4',
    );
  }

  static late final Constants instance = Constants.of();

  final String endpoint;
  final String apiKey;
}
