import 'package:dart_tests/classes/viacep.dart';
import 'package:dart_tests/dart_tests.dart' as app;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'dart_tests_test.mocks.dart';

//Anotação para gerar classe intermediária que nos ajudará a fazer o mock
//Executar no terminal dart run build_runner build --delete-conflicting-outputs(Irá gerar arquivo de mock de forma limpa com esta flag)
@GenerateMocks([
  MockViaCep
]) //classe que será gerada(É um array pois podemos ter varias classes geradas)
void main() {
  test('Calcular valor do produto com desconto sem percentual', () {
    expect(app.calcularDesconto(1000, 150, false), equals(850));
  });

  test('Calcular valor do produto com desconto com percentual', () {
    expect(app.calcularDesconto(1000, 15, true), equals(850));
  });

  test('Calcular valor do produto com valor zerado', () {
    expect(() => app.calcularDesconto(0, 150, false),
        throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Calcular valor do produto com desconto zerado', () {
    expect(() => app.calcularDesconto(1000, 0, true),
        throwsA(TypeMatcher<ArgumentError>()));
  });

  test("Retornar CEP", () async {
    MockMockViaCep mockMockViaCep = MockMockViaCep();
    //quando for chamado o metodo retornar cep, deve ser chamado algo que deixaremos fixo(.thenAnswer)
    //O retorno (Future.value) deverá ser o retorno do viacep no formato map
    //Leitura final: Quando eu chamar a função retornaCep, "moque" estes retornos(linha 40 à 49) caso eu passe esse parametro("01001000")
    when(mockMockViaCep.retornarCep("01001000"))
        .thenAnswer((realInvocation) => Future.value({
              "cep": "01001-000",
              "logradouro": "Praça da Sé",
              "complemento": "lado ímpar",
              "bairro": "Sé",
              "localidade": "São Paulo",
              "uf": "SP",
              "ibge": "3550308",
              "gia": "1004",
              "ddd": "11",
              "siafi": "7107"
            }));

    var body = await mockMockViaCep.retornarCep("01001000");
    expect(body["bairro"], equals("Sé"));
  });
}

class MockViaCep extends Mock implements ViaCep {}
