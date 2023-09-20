import 'package:dart_tests/dart_tests.dart' as app;
import 'package:test/test.dart';

void main() {
  test('Calcular valor do produto com desconto sem percentual', () {
    expect(app.calcularDesconto(1000, 150, false), 850);
  });

  test('Calcular valor do produto com desconto com percentual', () {
    expect(app.calcularDesconto(1000, 15, true), 850);
  });

  test('Calcular valor do produto com valor zerado', () {
    expect(() => app.calcularDesconto(0, 150, false), throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Calcular valor do produto com desconto zerado', () {
    expect(() => app.calcularDesconto(1000, 0, true), throwsA(TypeMatcher<ArgumentError>()));
  });
}
