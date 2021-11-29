import 'package:flutter_test/flutter_test.dart';
import 'package:validator/input_validator.dart';

void main() {
  group('Input validator', () {
    test('Valid email', () {
      expect(InputValidator.isValidEmail('vinh.truongtrong@gmail.com'), true);
    });
    test('Invalid email - wrong format', () {
      expect(InputValidator.isValidEmail('vinh.truongtrong@gmail'), false);
    });
    test('Invalid email - without @', () {
      expect(InputValidator.isValidEmail('vinh.truongtronggmail'), false);
    });

    test('Valid password', () {
      expect(InputValidator.isValidPassword('123123'), true);
    });
    test('Invalid password - trim input', () {
      expect(InputValidator.isValidPassword('      '), false);
    });
    test('Invalid password - length < 6', () {
      expect(InputValidator.isValidPassword('12312'), false);
    });
  });
}
