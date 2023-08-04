import 'package:example/hihi/data/local_data_sources/hihi_local_data_source.dart';
import 'package:example/hihi/data/remote_data_sources/hihi_remote_data_source.dart';
import 'package:example/hihi/domain/repositories/hihi_repository.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/use_case/hihi_use_case.dart';
import 'bloc/hihi_bloc.dart';

//TODO: router
// _setRouter(
//   RoutePath.hihi,
//   handler: hihiHandler,
// );
//TODO: router path
// /// {@macro example.lib.hihi.presentation.hihi}
// static const String hihi = HihiPage.name;

Handler hihiHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return BlocProvider(
    create: (context) => HihiBloc(
      HihiUseCase(
        HihiRepositoryImlp(
          HihiRemoteDataSource(),
          HihiLocalDataSource(),
        ),
      ),
    )..add(HihiInitEvent()),
    child: const HihiPage(),
  );
});

class HihiPage extends StatefulWidget {
  const HihiPage({super.key});

  /// {@template example.lib.hihi.presentation.hihi}
  /// ```dart
  /// Routes.router.navigateTo(
  ///   context,
  ///   RoutePath.hihi,
  /// )
  /// ```
  /// {@endtemplate}
  static const String name = 'hihi';

  @override
  State<HihiPage> createState() => _HihiPageState();
}

class _HihiPageState extends State<HihiPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HihiBloc, HihiState>(
      listener: (context, state) {
        switch (state) {
          case HihiLoading():
            break;
          case HihiFailure():
            break;
          case HihiSuccess():
            break;
        }
      },
      child: BlocBuilder<HihiBloc, HihiState>(
        builder: (context, state) {
          switch (state) {
            case HihiInitial():
              return Container();
            case HihiFailure():
              return Center(
                child: Text(
                  state.error,
                ),
              );
            case HihiSuccess():
              return Scaffold(
                appBar: AppBar(
                  leading: Center(
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.keyboard_backspace_outlined,
                      ),
                    ),
                  ),
                  centerTitle: true,
                  title: Text(
                    'Hihi',
                  ),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                backgroundColor: Colors.white,
                body: Padding(
                  padding: EdgeInsets.all(19).copyWith(top: 16),
                  child: Column(
                    children: [
                      Text(
                        'example.lib.hihi.presentation.hihi',
                      ),
                    ],
                  ),
                ),
              );
          }
          return Container();
        },
      ),
    );
  }
}
