import 'dart:html';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main(){
  querySelector('#search').onClick.listen((click) async {
    var cep = (querySelector('#cep') as InputElement).value;
    var url = 'https://viacep.com.br/ws/$cep/json/';
    
    var response = await http.get(url);
    var body = jsonDecode(response.body);
    print(body);
    var id = ['uf', 'localidade', 'bairro', 'logradouro'];
    for (var id in id ) {
      (querySelector('#$id') as InputElement).value = body['$id']; 
    }
  });
}
