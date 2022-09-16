class Endereco {
  // Logradouro, Número, Complemento, Bairro, Estado e CEP
  final String logradouro;
  final int numero;
  final String complemento;
  final String bairro;
  final String cidade;
  final String estado;
  late String _cep;

  Endereco( this._cep,{
    required this.logradouro,
    required this.numero,
    required this.complemento,
    required this.bairro,
    required this.cidade,
    required this.estado,
  });

    String get cep{
    String cepTratado = "${_cep.substring(0,5)}-${_cep.substring(5,8)}";
    return cepTratado;
  }
}
