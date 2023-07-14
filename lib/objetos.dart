class UsuarioComum {
  String telefone;
  String email;
  String nome;
  String senha;
  String perfil;
  String cpf;

  UsuarioComum({
    required this.telefone,
    required this.email,
    required this.nome,
    required this.senha,
    required this.perfil,
    required this.cpf,
  });
}

class Nutricionista extends UsuarioComum {
  List<String> artigosPublicados;
  String formacao;
  String biografia;
  String regiao;
  String localAtuacao;
  String contato;

  Nutricionista({
    required String telefone,
    required String email,
    required String nome,
    required String senha,
    required String perfil,
    required String cpf,
    required this.artigosPublicados,
    required this.formacao,
    required this.biografia,
    required this.regiao,
    required this.localAtuacao,
    required this.contato,
  }) : super(
    telefone: telefone,
    email: email,
    nome: nome,
    senha: senha,
    perfil: perfil,
    cpf: cpf,
  );
}

class Produtor extends UsuarioComum {
  String informacoesContato;
  Endereco localAtuacao;

  Produtor({
    required String telefone,
    required String email,
    required String nome,
    required String senha,
    required String perfil,
    required String cpf,
    required this.informacoesContato,
    required this.localAtuacao,
  }) : super(
    telefone: telefone,
    email: email,
    nome: nome,
    senha: senha,
    perfil: perfil,
    cpf: cpf,
  );
}

class Endereco {
  String pais;
  String estado;
  String cidade;
  String bairro;
  String rua;

  Endereco({
    required this.pais,
    required this.estado,
    required this.cidade,
    required this.bairro,
    required this.rua,
  });
}
