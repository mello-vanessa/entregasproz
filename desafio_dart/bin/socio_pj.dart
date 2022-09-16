import 'socio.dart';

class Sociopj extends Socio{
  String cnpj;
  String? nomefantasia;

  Sociopj({
    //nome = razao social
    required super.nome,
    required super.endereco,
    required this.cnpj,
    required this.nomefantasia,
  }) : super(cnpj);

  @override
  set cadastro(String nome){
    nome = nome;
    endereco = endereco;
    cnpj = cnpj;
    nomefantasia = nomefantasia;

    return;
  }
  @override
  get documento{
    String cnpjTratado = "${cnpj.substring(0,2)}.${cnpj.substring(2,5)}.${cnpj.substring(5,8)}/${cnpj.substring(8,12)}-${cnpj.substring(12,14)}";
    return cnpjTratado;
  }
}