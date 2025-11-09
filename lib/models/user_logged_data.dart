/// User data model for logged-in user

class UserLoggedData {
  final String accessToken;
  final String tokenType;
  final UserData user;

  UserLoggedData({
    required this.accessToken,
    required this.tokenType,
    required this.user,
  });

  factory UserLoggedData.fromJson(Map<String, dynamic> json) {
    return UserLoggedData(
      accessToken: json['access_token'] as String? ?? '',
      tokenType: json['token_type'] as String? ?? 'bearer',
      user: UserData.fromJson(json['user'] as Map<String, dynamic>? ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'token_type': tokenType,
      'user': user.toJson(),
    };
  }
}

class UserData {
  final int id;
  final String email;
  final String nome;
  final String cidade;
  final String estado;
  final String bairro;
  final String genero;
  final String corRaca;
  final bool isPcd;
  final bool isMentor;
  final String sobre;
  final String localidadeEscola;
  final String nomeEscola;
  final String pontosFortes;
  final String areasInteresse;
  final String atividadesExtracurriculares;
  final String cidadeAtual;
  final String estadoAtual;
  final String rendaFamiliar;
  final String disponibilidade;
  final String objetivos;
  final String cargoAtual;
  final String localPretendeTrabalharOuEstudar1;
  final String localPretendeTrabalharOuEstudar2;
  final String localPretendeTrabalharOuEstudar3;
  final String formacaoAcademica;
  final String nomeFaculdade;
  final String localidadeFaculdade;
  final String nomeMestrado;
  final String localidadeMestrado;
  final String nomeDoutorado;
  final String localidadeDoutorado;
  final String nomePhd;
  final String localidadePhd;
  final String experiencias;
  final String linkedinId;
  final String createdAt;

  UserData({
    required this.id,
    required this.email,
    required this.nome,
    required this.cidade,
    required this.estado,
    required this.bairro,
    required this.genero,
    required this.corRaca,
    required this.isPcd,
    required this.isMentor,
    required this.sobre,
    required this.localidadeEscola,
    required this.nomeEscola,
    required this.pontosFortes,
    required this.areasInteresse,
    required this.atividadesExtracurriculares,
    required this.cidadeAtual,
    required this.estadoAtual,
    required this.rendaFamiliar,
    required this.disponibilidade,
    required this.objetivos,
    required this.cargoAtual,
    required this.localPretendeTrabalharOuEstudar1,
    required this.localPretendeTrabalharOuEstudar2,
    required this.localPretendeTrabalharOuEstudar3,
    required this.formacaoAcademica,
    required this.nomeFaculdade,
    required this.localidadeFaculdade,
    required this.nomeMestrado,
    required this.localidadeMestrado,
    required this.nomeDoutorado,
    required this.localidadeDoutorado,
    required this.nomePhd,
    required this.localidadePhd,
    required this.experiencias,
    required this.linkedinId,
    required this.createdAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] as int? ?? 0,
      email: json['email'] as String? ?? '',
      nome: json['nome'] as String? ?? '',
      cidade: json['cidade'] as String? ?? '',
      estado: json['estado'] as String? ?? '',
      bairro: json['bairro'] as String? ?? '',
      genero: json['genero'] as String? ?? '',
      corRaca: json['cor_raca'] as String? ?? '',
      isPcd: json['is_pcd'] as bool? ?? false,
      isMentor: json['is_mentor'] as bool? ?? false,
      sobre: json['sobre'] as String? ?? '',
      localidadeEscola: json['localidade_escola'] as String? ?? '',
      nomeEscola: json['nome_escola'] as String? ?? '',
      pontosFortes: json['pontos_fortes'] as String? ?? '',
      areasInteresse: json['areas_interesse'] as String? ?? '',
      atividadesExtracurriculares:
          json['atividades_extracurriculares'] as String? ?? '',
      cidadeAtual: json['cidade_atual'] as String? ?? '',
      estadoAtual: json['estado_atual'] as String? ?? '',
      rendaFamiliar: json['renda_familiar'] as String? ?? '',
      disponibilidade: json['disponibilidade'] as String? ?? '',
      objetivos: json['objetivos'] as String? ?? '',
      cargoAtual: json['cargo_atual'] as String? ?? '',
      localPretendeTrabalharOuEstudar1:
          json['local_pretende_trabalhar_ou_estudar_1'] as String? ?? '',
      localPretendeTrabalharOuEstudar2:
          json['local_pretende_trabalhar_ou_estudar_2'] as String? ?? '',
      localPretendeTrabalharOuEstudar3:
          json['local_pretende_trabalhar_ou_estudar_3'] as String? ?? '',
      formacaoAcademica: json['formacao_academica'] as String? ?? '',
      nomeFaculdade: json['nome_faculdade'] as String? ?? '',
      localidadeFaculdade: json['localidade_faculdade'] as String? ?? '',
      nomeMestrado: json['nome_mestrado'] as String? ?? '',
      localidadeMestrado: json['localidade_mestrado'] as String? ?? '',
      nomeDoutorado: json['nome_doutorado'] as String? ?? '',
      localidadeDoutorado: json['localidade_doutorado'] as String? ?? '',
      nomePhd: json['nome_phd'] as String? ?? '',
      localidadePhd: json['localidade_phd'] as String? ?? '',
      experiencias: json['experiencias'] as String? ?? '',
      linkedinId: json['linkedin_id'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'nome': nome,
      'cidade': cidade,
      'estado': estado,
      'bairro': bairro,
      'genero': genero,
      'cor_raca': corRaca,
      'is_pcd': isPcd,
      'is_mentor': isMentor,
      'sobre': sobre,
      'localidade_escola': localidadeEscola,
      'nome_escola': nomeEscola,
      'pontos_fortes': pontosFortes,
      'areas_interesse': areasInteresse,
      'atividades_extracurriculares': atividadesExtracurriculares,
      'cidade_atual': cidadeAtual,
      'estado_atual': estadoAtual,
      'renda_familiar': rendaFamiliar,
      'disponibilidade': disponibilidade,
      'objetivos': objetivos,
      'cargo_atual': cargoAtual,
      'local_pretende_trabalhar_ou_estudar_1': localPretendeTrabalharOuEstudar1,
      'local_pretende_trabalhar_ou_estudar_2': localPretendeTrabalharOuEstudar2,
      'local_pretende_trabalhar_ou_estudar_3': localPretendeTrabalharOuEstudar3,
      'formacao_academica': formacaoAcademica,
      'nome_faculdade': nomeFaculdade,
      'localidade_faculdade': localidadeFaculdade,
      'nome_mestrado': nomeMestrado,
      'localidade_mestrado': localidadeMestrado,
      'nome_doutorado': nomeDoutorado,
      'localidade_doutorado': localidadeDoutorado,
      'nome_phd': nomePhd,
      'localidade_phd': localidadePhd,
      'experiencias': experiencias,
      'linkedin_id': linkedinId,
      'created_at': createdAt,
    };
  }
}

