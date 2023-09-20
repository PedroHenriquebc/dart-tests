import 'package:dart_tests/dart_tests.dart' as app;
import 'package:test/test.dart';

void main() {
  test('Calcular valor do produco com desconto sem percentual', () {
    expect(app.calcularDesconto(1000, 150, false), 850);
  });

  test('Calcular valor do produco com desconto com percentual', () {
    expect(app.calcularDesconto(1000, 15, true), 850);
  });
}
