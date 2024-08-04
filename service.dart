import 'dart:convert';
import 'package:http/http.dart' as http;


class Service {
  
  Future<int> obterValorDaJogada() async {
    try {
      var resposta = await http.get(Uri.parse(''));
      if (resposta.statusCode == 200) {
        var respostaJSON = jsonDecode(resposta.body);
        return respostaJSON['number'];
      } else {
        print('Erro na resposta: ${resposta.statusCode}');
        return 0;
      }
    } catch (e) {
      print('Erro: $e');
      return 0;
    }
  }
}
