import 'package:agronomico/comum/modelo/historico_atualizacao_model.dart';
import 'package:meta/meta.dart';
import 'package:agronomico/comum/db/db.dart';

class SincronizacaoHistoricoRepository {
  final Db db;

  SincronizacaoHistoricoRepository({@required this.db});

  Future<void> salvarDataAtualizacao(
      String tabela, Duration duracao, int quantidadeRegistros) async {
    final dbInstance = await db.get();

    await dbInstance.delete('historico_sincronizacao',
        where: "tabela = '$tabela'");

    await dbInstance.insert('historico_sincronizacao', {
      'tabela': tabela,
      'dataAtualizacao': DateTime.now().toIso8601String(),
      'duracao': duracao.inMilliseconds,
      'quantidade': quantidadeRegistros,
    });
  }

  Future<List<HistoricoAtualizacaoModel>> buscarHistorico() async {
    final dbInstance = await db.get();
    final List historicoAtualizacao =
        await dbInstance.query('historico_sincronizacao');
    return historicoAtualizacao
        .map<HistoricoAtualizacaoModel>((itemHistorico) =>
            HistoricoAtualizacaoModel.fromJson(itemHistorico))
        .toList();
  }
}
