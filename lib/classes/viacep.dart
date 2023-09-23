import 'dart:convert';
import 'package:http/http.dart' as http;

class ViaCep {
  //chamada assincrona, precisamos escrever async para receber seu retorno correto
  //e também precisamos especificar o tipo Future<>
  Future<Map<dynamic, dynamic>> retornarCep(String cep) async {
    var uri = Uri.parse("https://viacep.com.br/ws/$cep/json/");
    var retorno = await http.get(uri); //corpo do retorno vindo do get
    /* Não conseguiremos testar os campos json que vem do retorno pois ele vem em formato de string, 
    precisamos convertê-lo para Map utilizando a conversao abaixo; */
    var decodedResponse = jsonDecode(utf8.decode(retorno.bodyBytes)) as Map;
    print(decodedResponse);
    return decodedResponse;
  }
}
