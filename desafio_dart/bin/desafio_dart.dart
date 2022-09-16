import 'dart:io';
import 'empresa.dart';
import 'endereco.dart';
import 'socio.dart';
import 'socio_pf.dart';
import 'socio_pj.dart';

void main(List<String> arguments) {

  final empresas = <Map<String, dynamic>>[];
  String opcao = "";

  Socio socio01pf = Sociopf(
    nome: "Vanessa Mello", 
    endereco: Endereco(
    "94258001", 
    logradouro: "Rua Oscar Pereira", 
    numero: 102030, 
    complemento: "Apto 01", 
    bairro: "Vila Assunção", 
    cidade: "São Leopoldo",
    estado: "RS"), 
    cpf: "76367980008");

  Socio socio01pj = Sociopj(
    nome: "Marcela Macedo Tapetes e Cortinas LTDA", 
    nomefantasia: "Tapetes e Cortinas da Ma",
    endereco: Endereco(
    "92412001", 
    logradouro: "Rua Pedro Boticário", 
    numero: 102030, 
    complemento: "204", 
    bairro: "Higienópolis", 
    cidade: "São Leopoldo",
    estado: "RS"), 
    cnpj: "92456516000163");

  final empresa01 = Empresa(
    "11941838000104", 
    "51981310595", 
    razaoSocial: "App Comercial e tecnologia S.A.", 
    nomefantasia: "AppTech", 
    endereco: Endereco(
    "90520000", 
    logradouro: "Rua Dr Paulo Uebel", 
    numero: 201125, 
    complemento: "Térreo", 
    bairro: "Centro", 
    cidade: "Porto Alegre",
    estado: "RS"), 
    socio: socio01pj);

  do {
    print('''
      Digite a opção desejada:
      1. Cadastrar nova empresa
      2. Buscar Empresa cadastrada por CNPJ
      3. Buscar Empresa por CPF/CNPJ do Sócio
      4. Listar Empresas cadastradas em ordem alfabética (baseado na Razão Social)
      5. Excluir uma empresa (por ID)
      6. Sair
    ''');
    opcao = stdin.readLineSync()!;

    switch (opcao) {
      case "1":
        empresa01.cadastrarEmpresa(empresas);
        break;
      case "2":
        if(empresas.isNotEmpty){
          empresa01.buscarEmpresasCnpj(empresas);
        } else {
          print("Não há empresas cadastradas.");
        }
        break;
      case "3":
        if(empresas.isNotEmpty){
          empresa01.buscarEmpresasPorSocio(empresas);
        } else {
          print("Não há empresas cadastradas.");
        }      
        break;
      case "4":
        if(empresas.isNotEmpty){
          empresa01.mostrarEmpresasRazaoSocial(empresas);
        } else {
          print("Não há empresas cadastradas.");
        }      
        break;
      case "5":
        if(empresas.isNotEmpty){
          empresa01.removerEmpresa(empresas);
        } else {
          print("Não há empresas cadastradas.");
        }
        break;
      case "6":
        print("Obrigada por usar o sistema."); 
        break;     
      default:
        print("Opção inválida.");
        break;
    }
  } while(opcao != "6");
}
