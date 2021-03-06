import 'package:agronomico/comum/db/db.dart';
import 'package:agronomico/comum/repositorios/preferencia_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_bloc.dart';
import 'base_builder.dart';
import 'base_event.dart';

class BaseProvider extends StatelessWidget {
  final String title;
  final Widget home;

  BaseProvider({@required this.title, @required this.home});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BaseBloc>(
        create: (context) =>
            BaseBloc(preferenciaRepository: PreferenciaRepository(db: Db()))
              ..add(IniciarBase()),
        child: BaseBuilder(title: title, home: home));
  }
}
