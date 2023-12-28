import 'package:dart_lib_starter/dart_lib_starter.dart';
import 'package:test/test.dart';

void main() {
  group('Test demo suite', () {
    test('This is demo case 1', () {
      var ret = sayHello();
      expect(ret, 'hello world!');
    });
  });
}