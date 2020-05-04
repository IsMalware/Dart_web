import 'dart:html';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dialog/dialog.dart';

void main() async {
  querySelector('#searchCity').onClick.listen((a) async {
    var myPrompt = await prompt('Qual cidade você quer adicionar??');
    if(myPrompt.toString().isNotEmpty){
      carregarDados([myPrompt.toString()]);
    }else{
      alert('Nenhuma cidade informada!!'); 
    }
  });
}

Future pegarClima(String cidade) async {
  var url = 'https://api.hgbrasil.com/weather?format=json-cors&key=642c67bf&city_name=$cidade';
  return http.get(url);
  
}

void carregarDados(List cidades) {

  var empty = querySelector('#empty');
  
  if(empty != null) {
    empty.remove();
  }
  
  cidades.forEach((cidade){
    inserirDado(pegarClima(cidade));
  });
}

void inserirDado(Future dado) async {
  var response = await dado;
  var body = jsonDecode(response.body);
  if (body['results']['forecast'].length > 0) {
    var html = '<div class="row">';
    html += '<div class="cell">${body['results']['city_name']}</div>';
    html += '<div class="cell">${body['results']['temp']}°C</div>';
    html += '<div class="cell">${body['results']['description']}</div>';
    html += '<div class="cell">${body['results']['wind_speedy']}</div>';
    html += '<div class="cell">${body['results']['sunrise']}</div>';
    html += '<div class="cell">${body['results']['sunset']}</div>';
    html += '</div>';

    querySelector('.table').innerHtml += html;
  }
}

String formatarHtml(var dado){
  return '<div class="cell">$dado</div>';
}
