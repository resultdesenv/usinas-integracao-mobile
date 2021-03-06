import 'package:agronomico/comum/modelo/estimativa_modelo.dart';
import 'package:agronomico/comum/modelo/upnivel3_model.dart';
import 'package:equatable/equatable.dart';

class ApontamentoEstimativaState extends Equatable {
  final List<EstimativaModelo> apontamentos;
  final List<UpNivel3Model> apontIniciais;
  final bool loading;
  final String mensagemErro;
  final bool criacao;
  final bool edicaoConcluida;

  ApontamentoEstimativaState({
    this.apontamentos = const [],
    this.apontIniciais = const [],
    this.loading = false,
    this.mensagemErro,
    this.criacao = false,
    this.edicaoConcluida = false,
  });

  ApontamentoEstimativaState juntar({
    List<EstimativaModelo> apontamentos,
    List<UpNivel3Model> apontIniciais,
    bool loading,
    bool criacao,
    bool edicaoConcluida,
    String mensagemErro,
  }) {
    return ApontamentoEstimativaState(
      apontamentos: apontamentos ?? this.apontamentos,
      apontIniciais: apontIniciais ?? this.apontIniciais,
      loading: loading ?? this.loading,
      criacao: criacao ?? this.criacao,
      edicaoConcluida: edicaoConcluida ?? this.edicaoConcluida,
      mensagemErro: mensagemErro,
    );
  }

  @override
  List<Object> get props => [
        apontamentos,
        apontIniciais,
        loading,
        mensagemErro,
        criacao,
        edicaoConcluida,
      ];
}
