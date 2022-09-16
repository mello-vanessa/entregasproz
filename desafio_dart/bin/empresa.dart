import 'dart:io';
import 'package:uuid/uuid.dart';
import 'endereco.dart';
import 'socio.dart';

class Empresa {
  final _id = Uuid().v1();
  String? razaoSocial;
  String? nomefantasia;
  String _cnpj;
  Endereco? endereco;
  String _telefone;
  Socio? socio;
  final DateTime _horarioCadastro = DateTime.now();

  Empresa(this._cnpj, this._telefone,{
    required this.razaoSocial,
    required this.nomefantasia,
    required this.endereco,
    required this.socio,
  });

  String get cnpj{
    _cnpj =  "${_cnpj.substring(0,2)}.${_cnpj.substring(2,5)}.${_cnpj.substring(5,8)}/${_cnpj.substring(8,12)}-${_cnpj.substring(12,14)}";
    return _cnpj;
  }

  String get telefone{
    _telefone = "(${_telefone.substring(0,2)}) ${_telefone.substring(2,3)} ${_telefone.substring(3,7)}-${_telefone.substring(7,11)}";
    return _telefone;
  }

  String get id => _id;
  DateTime get horarioCadastro => _horarioCadastro;  

  void cadastrarEmpresa(List<Map<String, dynamic>> listaMapasDefault){
    final mapaUnicoDentroDaListaDeMapasDefault = <String, dynamic>{
      'id': id,
      'razaoSocial': razaoSocial,
      'nomeFantasia': nomefantasia,
      'cnpj': cnpj,
      'endereco': endereco,
      'telefone': telefone,
      'horarioCadastro': horarioCadastro,
      'socio': socio,
    };
    listaMapasDefault.add(mapaUnicoDentroDaListaDeMapasDefault);
    print("Empresa cadastrada com sucesso.");
    retornoDados(listaMapasDefault);
  }
    
  void mostrarEmpresasRazaoSocial(List<Map<String, dynamic>> listaMapasDefault){
    print("Lista de empresas em ordem alfabética por Razão Social.");
    final listaOrdenada = List<Map<String, dynamic>>.from(listaMapasDefault);
    listaOrdenada.sort((a, b) => a['razaoSocial'].toString().toUpperCase().compareTo(b['razaoSocial'].toString().toUpperCase()));
    retornoDados(listaOrdenada);
  }

  void buscarEmpresasCnpj(List<Map<String, dynamic>> listaMapasDefault){
    print("Digite o CNPJ da empresa:");
    String cnpjPesquisa = stdin.readLineSync()!;
    for(int i = 0; i < listaMapasDefault.length; i++){
      print(listaMapasDefault[i]['cnpj']);
      if(listaMapasDefault[i]['cnpj'].replaceAll(".", "").replaceAll("/", "").replaceAll("-", "") == cnpjPesquisa){
        retornoDados(listaMapasDefault);
      }
      else {
        print("$cnpjPesquisa não encontrado.");
      }
    }    
  }

  void buscarEmpresasPorSocio(List<Map<String, dynamic>> listaMapasDefault){
    print("Digite o CNPJ ou CPF do sócio ou 0 para listar as empresas.");
    String docPesquisa = stdin.readLineSync()!;
    if(docPesquisa == "0") {
      mostrarEmpresasRazaoSocial(listaMapasDefault);
    } else {
        for(int i = 0; i < listaMapasDefault.length; i++){
          if(listaMapasDefault[i]['socio'].documento.replaceAll(".", "").replaceAll("/", "").replaceAll("-", "") == docPesquisa){
            retornoDados(listaMapasDefault);
          }
          else {
            print("$docPesquisa não encontrado, segue lista das empresas cadastradas.");
            mostrarEmpresasRazaoSocial(listaMapasDefault);
          }
        }
      }
  }  

  void retornoDados(List<Map<String, dynamic>> listaMapasDefault){
        int i = 0;
        String dados = "";
        try{
          listaMapasDefault[i]['socio'].nomefantasia;
          dados = "CNPJ: ${listaMapasDefault[i]['socio'].documento}\nRazão social: ${listaMapasDefault[i]['socio'].nome}\nNome Fantasia: ${listaMapasDefault[i]['socio'].nomefantasia}\nEndereço: ${listaMapasDefault[i]['socio'].endereco.logradouro}, ${listaMapasDefault[i]['socio'].endereco.numero}, ${listaMapasDefault[i]['socio'].endereco.bairro}, ${listaMapasDefault[i]['socio'].endereco.cidade}/${listaMapasDefault[i]['socio'].endereco.estado}, ${listaMapasDefault[i]['socio'].endereco.cep}";
        } catch(e){
          dados = "CPF: ${listaMapasDefault[i]['socio'].documento}\nNome Completo: ${listaMapasDefault[i]['socio'].nome}\nEndereço: ${listaMapasDefault[i]['socio'].endereco.logradouro}, ${listaMapasDefault[i]['socio'].endereco.numero}, ${listaMapasDefault[i]['socio'].endereco.bairro}, ${listaMapasDefault[i]['socio'].endereco.cidade}/${listaMapasDefault[i]['socio'].endereco.estado}, ${listaMapasDefault[i]['socio'].endereco.cep}";
        }
        print('''
ID: ${listaMapasDefault[i]['id']}
CNPJ: ${listaMapasDefault[i]['cnpj']} Data Cadastro: ${listaMapasDefault[i]['horarioCadastro']}
Razão Social: ${listaMapasDefault[i]['razaoSocial']}
Nome Fantasia: ${listaMapasDefault[i]['nomeFantasia']}
Telefone: ${listaMapasDefault[i]['telefone']}
Endereço: ${listaMapasDefault[i]['endereco'].logradouro}, ${listaMapasDefault[i]['endereco'].numero}, ${listaMapasDefault[i]['endereco'].complemento}, ${listaMapasDefault[i]['endereco'].bairro}, ${listaMapasDefault[i]['endereco'].cidade}/${listaMapasDefault[i]['endereco'].estado}, ${listaMapasDefault[i]['endereco'].cep}
Sócio: 
$dados
        ''');
  }

  void removerEmpresa(List<Map<String, dynamic>> listaMapasDefault){
    if(listaMapasDefault.isNotEmpty){
      buscarEmpresasPorSocio(listaMapasDefault);
      print("Digite o ID da empresa a ser removida.");
      String idPesquisa = stdin.readLineSync()!;
      if(listaMapasDefault.isNotEmpty){
        for(int i = 0; i < listaMapasDefault.length; i++){
          if(idPesquisa == listaMapasDefault[i]['id']){
            listaMapasDefault.removeAt(i);
            print("Empresa removida.");
          }
          else {
            print("Empresa inexistente.");
          }
        }
      }
      else{
        print("A lista de empresas está vazia.");
      }
    }
  }  
}
