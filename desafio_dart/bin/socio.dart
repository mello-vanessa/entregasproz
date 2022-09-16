import 'endereco.dart';

abstract class Socio{
  String nome;
  String _documento;
  Endereco endereco;

  Socio(
    this._documento,{
    required this.nome,
    required this.endereco,
    });

  set cadastro(String nome){
    nome = nome;
    _documento = _documento;
    endereco = endereco;
    return;
  }
  
  get documento{
    _documento = _documento;
    return _documento;
  }
}