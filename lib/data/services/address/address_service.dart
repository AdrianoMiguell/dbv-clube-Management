import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class AddressService {
  static Future<Map<String, dynamic>?> buscarCep(String cep) async {
    final cleanCep = cep.replaceAll(RegExp(r'[^0-9]'), '');
    if (cleanCep.length != 8) return null;
    final uri = Uri.parse('https://viacep.com.br/ws/$cleanCep/json/');
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.containsKey('erro')) {
          debugPrint("CEP não encontrado.");
          return null;
        }
        return data;
      }
    } catch (e) {
      debugPrint("Erro na requisição: $e");
      return null;
    }
  }
}
