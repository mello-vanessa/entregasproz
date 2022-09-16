import 'socio.dart';

class Sociopf extends Socio{
  String cpf;

  Sociopf({
    required super.nome,
    required super.endereco,
    required this.cpf,
//aqui eu digo que o cpf é o referente ao documento da super classe Socio
  }) : super(cpf);

  @override
  set cadastro(String nome){
    nome = nome;
    endereco = endereco;
    cpf = cpf;
    return;
  }
  @override
  get documento{
    String cpfTratado = "${cpf.substring(0,3)}.${cpf.substring(3,6)}.${cpf.substring(6,9)}-${cpf.substring(9,11)}";
    return cpfTratado;
  }
}
